#!/bin/sh

# Copyright (c) 2013 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# This script invokes awk_process_syn to compute and print the
# intervals between SYN_REPORT packets generated by the specified
# touch device.

# Usage: tools/print_syn.sh
#        press 'q' to terminate

. /usr/share/misc/shflags
DEFINE_string device "touchpad" "the touch device (touchpad or touchscreen)" "d"
DEFINE_string file "/tmp/interval_event.dat" "the event data filename" "f"

FLAGS_HELP="USAGE: $PROG [flags]"

FLAGS "$@" || exit 1
eval set -- "${FLAGS_ARGV}"
set -e


# Derive the device node of the specified device.
if [ $FLAGS_device = "touchscreen" ]; then
  control_script="/opt/google/touchscreen/tscontrol status"
else
  FLAGS_device="touchpad"
  control_script="/opt/google/touchpad/tpcontrol status"
fi

# device_node_info looks like:
#     Device Node (250):      "/dev/input/event8"
device_node_info=`$control_script |  grep -i "Device Node"`
device_node=`echo $device_node_info | sed -n "s/.*\"\(.*\)\"/\1/p"`
echo "device_node for ${FLAGS_device}: $device_node"

echo "Large intervals are preceded with *****."
echo "Remember to press 'q' to terminate.\n"


# Get the directory of the awk script.
SYN_PROG="awk_process_syn"
syn_dir=`dirname $0`

cmd="DISPLAY=:0 mtplot $device_node | tee $FLAGS_file | $syn_dir/${SYN_PROG}"
echo "Executing ... $cmd"
eval $cmd
