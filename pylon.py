#!/usr/bin/env python

import functools

#
@functools.cache
def _getenv(var):
  from os import getenv
  return getenv(var)

#
@functools.cache
def _X():
  from Xlib import X
  return X

#
@functools.cache
def _display():
  from Xlib.display import Display
  return Display()

#
@functools.cache
def _root():
  return _display().screen().root

#
@functools.cache
def _atom(atom_name):
  return _display().get_atom(atom_name)

#
@functools.cache
def _Gdk():
  import gi
  gi.require_version('Gdk', '3.0')
  from gi.repository import Gdk
  return Gdk

#
@functools.cache
def _GdkX11():
  import gi
  from gi.repository import GdkX11
  return GdkX11

#
@functools.cache
def _gdk_display():
  return _GdkX11().X11Display.get_default()

#
@functools.cache
def _Wnck():
  import gi
  gi.require_version('Wnck', '3.0')
  from gi.repository import Wnck
  return Wnck

#
@functools.cache
def _wnck_screen():
  return _Wnck().Screen.get_default()

# ------------------------------------------------------------------------------

# root.change_attributes(event_mask=X.SubstructureNotifyMask)
# event = display.next_event()
# if event.type == X.CreateNotify or event.type == X.UnmapNotify:

# ------------------------------------------------------------------------------

#
@functools.cache
def get_desktop_width():
  return _root().get_full_property(
    _atom('_NET_DESKTOP_GEOMETRY'),
    _X().AnyPropertyType
  ).value[0]

#
@functools.cache
def get_viewport_count():
  return int(_getenv('VIEWPORT_COUNT') or 1)

#
@functools.cache
def get_viewport_width():
  return int(get_desktop_width() / get_viewport_count())

#
def get_window_by_id(window_id):
  return _display().create_resource_object('window', window_id)

#
def get_gdk_window_by_id(window_id):
  return _GdkX11().X11Window.foreign_new_for_display(_gdk_display(), window_id)

#
def get_wnck_window_by_id(window_id):
  _wnck_screen().force_update()
  return _Wnck().Window.get(window_id)

#
def get_all_window_ids():
  return _root().get_full_property(
    _atom('_NET_CLIENT_LIST'),
    _X().AnyPropertyType
  ).value;

#
def get_active_window_id():
  return _root().get_full_property(
    _atom('_NET_ACTIVE_WINDOW'),
    _X().AnyPropertyType
  ).value[0]

def get_pid_by_window_id(window_id):
  window = get_window_by_id(window_id)

  return window.get_full_property(
    _atom('_NET_WM_PID'),
    _X().AnyPropertyType,
    8
  ).value[0]

#
def window_id_has_wm_class(window_id, wm_class):
  window = get_window_by_id(window_id)

  try:
    wm_classes = window.get_wm_class()
    return wm_class in wm_classes if wm_classes != None else False
  except:
    return False

#
def get_window_ids_by_wm_class(wm_class):
  return [
    window_id for window_id
    in get_all_window_ids()
    if window_id_has_wm_class(window_id, wm_class)
  ]

#
def is_window_id_on_current_viewport(window_id):
  window = get_window_by_id(window_id)
  geometry = window.get_geometry()
  x = geometry.x

  while True:
    parent = window.query_tree().parent
    parent_geometry = parent.get_geometry()
    x += parent_geometry.x

    if parent.id == _root().id:
      break

    window = parent

  return 0 < x + (geometry.width / 2) < get_viewport_width()

#
def activate_window_by_id(window_id, switch_viewport = False):
  if switch_viewport:
    window = get_wnck_window_by_id(window_id)
    window.activate(1)
    return

  window = get_window_by_id(window_id)
  _display().set_input_focus(window, _X().RevertToParent, _X().CurrentTime)
  window.configure(stack_mode = _X().Above)
  _display().sync()

#
def close_window_by_id(window_id):
  window = get_window_by_id(window_id)
  window.destroy()

#
def get_pixel_rgba_at_window_id_coords(window_id, x, y):
  window = get_gdk_window_by_id(window_id)
  geometry = window.get_geometry()

  if x < 0:
    x = geometry.width + x

  if y < 0:
    y = geometry.height + y

  pixbuf = _Gdk().pixbuf_get_from_window(window, x, y, 1, 1)
  return tuple(pixbuf.get_pixels())

#
@functools.cache
def rgb_to_hex(rgb):
  return "#{:02X}{:02X}{:02X}".format(*rgb)
