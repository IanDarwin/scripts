#!/bin/sh

# simple reimplementation of ts

DEV=ps

groff -ms $* | lpr
