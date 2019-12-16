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
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/radi/householder/src/openai_ros"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/radi/householder/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/radi/householder/install/lib/python2.7/dist-packages:/home/radi/householder/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/radi/householder/build" \
    "/usr/bin/python" \
    "/home/radi/householder/src/openai_ros/setup.py" \
    build --build-base "/home/radi/householder/build/openai_ros" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/radi/householder/install" --install-scripts="/home/radi/householder/install/bin"
