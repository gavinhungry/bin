#!/usr/bin/env python

import os

from Xlib import X
from Xlib.display import Display

import gi
gi.require_version('Gdk', '3.0')
from gi.repository import Gdk
from gi.repository import GdkX11

display = Display()
root = display.screen().root

_NET_DESKTOP_GEOMETRY = display.get_atom('_NET_DESKTOP_GEOMETRY')
_NET_ACTIVE_WINDOW = display.get_atom('_NET_ACTIVE_WINDOW')
_NET_CLIENT_LIST = display.get_atom('_NET_CLIENT_LIST')

gdk_display = GdkX11.X11Display.get_default()

def get_desktop_width():
  return root.get_full_property(
    _NET_DESKTOP_GEOMETRY,
    X.AnyPropertyType
  ).value[0]

workspace_count = int(os.getenv('WORKSPACE_COUNT') or 1)
workspace_width = get_desktop_width() / workspace_count

#
def get_window_by_id(window_id):
  return display.create_resource_object('window', window_id)

#
def get_gdk_window_by_id(window_id):
  return GdkX11.X11Window.foreign_new_for_display(gdk_display, window_id)

#
def get_all_window_ids():
  return root.get_full_property(_NET_CLIENT_LIST, X.AnyPropertyType).value;

#
def get_active_window_id():
  return root.get_full_property(
    _NET_ACTIVE_WINDOW,
    X.AnyPropertyType
  ).value[0]

#
def window_id_has_wm_class(window_id, wm_class):
  window = get_window_by_id(window_id)
  return wm_class in window.get_wm_class()

#
def get_window_ids_by_wm_class(wm_class):
  return [
    window_id for window_id
    in get_all_window_ids()
    if window_id_has_wm_class(window_id, wm_class)
  ]

#
def is_window_id_on_current_workspace(window_id):
  window = get_window_by_id(window_id)
  geometry = window.get_geometry()
  x = geometry.x

  while True:
    parent = window.query_tree().parent
    parent_geometry = parent.get_geometry()
    x += parent_geometry.x

    if parent.id == root.id:
      break

    window = parent

  return 0 < x + (geometry.width / 2) < workspace_width

#
def get_pixel_color_at_window_id_coords(window_id, x, y):
  window = get_gdk_window_by_id(window_id)
  geometry = window.get_geometry()

  if x < 0:
    x = geometry.width + x

  if y < 0:
    y = geometry.height + y

  pixbuf = Gdk.pixbuf_get_from_window(window, x, y, 1, 1)
  pixel = tuple(pixbuf.get_pixels())
  return "#{:02X}{:02X}{:02X}".format(*pixel)
