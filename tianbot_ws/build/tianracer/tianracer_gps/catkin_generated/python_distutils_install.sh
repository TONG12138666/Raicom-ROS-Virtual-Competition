#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/syt/tianbot_ws/src/tianracer/tianracer_gps"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/syt/tianbot_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/syt/tianbot_ws/install/lib/python3/dist-packages:/home/syt/tianbot_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/syt/tianbot_ws/build" \
    "/usr/bin/python3" \
    "/home/syt/tianbot_ws/src/tianracer/tianracer_gps/setup.py" \
     \
    build --build-base "/home/syt/tianbot_ws/build/tianracer/tianracer_gps" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/syt/tianbot_ws/install" --install-scripts="/home/syt/tianbot_ws/install/bin"
