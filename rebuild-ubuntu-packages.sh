#!/bin/sh

rm -f ./debian/linux-tools-*-generic/usr/lib/linux-tools/*-generic/*
rm -f ./debian/linux-cloud-tools-*-generic/usr/lib/linux-tools/*-generic/*
rm -rf ./debian/linux-image-extra-*-generic/lib/modules/*-generic/kernel
rm -f ./debian/linux-tools-*-generic/usr/lib/linux-tools/*-generic/*
rm -f ./debian/stamps/stamp-build-generic
DEB_BUILD_OPTIONS=parallel=4 AUTOBUILD=1 NOEXTRAS=1 skipabi=true fakeroot debian/rules binary-headers binary-generic
