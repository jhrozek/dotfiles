# This file is NOT licensed under the GPLv3, which is the license for the rest
# of Samba.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import os
import ycm_core

flags = [
'-Wall',
'-Wextra',
'-Werror',
'-Wno-unused-parameter',
# This is a C project
'-x', 'c',
# Defines
'-DHAVE_CONFIG_H'
# System includes
'-I/usr/include',
'-I/usr/include/krb5',
'-I/usr/include/dbus-1.0',
'-I/usr/lib64/dbus-1.0/include',
'-I/usr/include/libnl3',
'-I/usr/include/glib-2.0',
'-I/usr/lib64/glib-2.0/include',
# Project includes
'-I.',
'-I..',
'-Iinclude',
'-I/home/remote/jhrozek/devel/sssd',
'-I/home/remote/jhrozek/devel/sssd/src',
'-I/home/remote/jhrozek/devel/sssd/src/sss_client',
'-I/home/remote/jhrozek/devel/sssd/include',
'-I/home/remote/jhrozek/devel/sssd/src/confdb',
'-I/home/remote/jhrozek/devel/sssd/src/db',
'-I/home/remote/jhrozek/devel/sssd/src/lib/idmap',
'-I/home/remote/jhrozek/devel/sssd/src/lib/sifp',
'-I/home/remote/jhrozek/devel/sssd/src/monitor',
'-I/home/remote/jhrozek/devel/sssd/src/providers',
'-I/home/remote/jhrozek/devel/sssd/src/providers/ad',
'-I/home/remote/jhrozek/devel/sssd/src/providers/ipa',
'-I/home/remote/jhrozek/devel/sssd/src/providers/krb5',
'-I/home/remote/jhrozek/devel/sssd/src/providers/ldap',
'-I/home/remote/jhrozek/devel/sssd/src/providers/proxy',
'-I/home/remote/jhrozek/devel/sssd/src/providers/simple',
'-I/home/remote/jhrozek/devel/sssd/src/resolv',
'-I/home/remote/jhrozek/devel/sssd/src/responder/autofs',
'-I/home/remote/jhrozek/devel/sssd/src/responder/common',
'-I/home/remote/jhrozek/devel/sssd/src/responder/ifp',
'-I/home/remote/jhrozek/devel/sssd/src/responder/nss',
'-I/home/remote/jhrozek/devel/sssd/src/responder/pac',
'-I/home/remote/jhrozek/devel/sssd/src/responder/pam',
'-I/home/remote/jhrozek/devel/sssd/src/responder/ssh',
'-I/home/remote/jhrozek/devel/sssd/src/responder/sudo',
'-I/home/remote/jhrozek/devel/sssd/src/sbus',
'-I/home/remote/jhrozek/devel/sssd/src/sss_client',
'-I/home/remote/jhrozek/devel/sssd/src/sss_client/autofs',
'-I/home/remote/jhrozek/devel/sssd/src/sss_client/idmap',
'-I/home/remote/jhrozek/devel/sssd/src/sss_client/libwbclient',
'-I/home/remote/jhrozek/devel/sssd/src/sss_client/nfs',
'-I/home/remote/jhrozek/devel/sssd/src/sss_client/ssh',
'-I/home/remote/jhrozek/devel/sssd/src/sss_client/sudo',
'-I/home/remote/jhrozek/devel/sssd/src/tests',
'-I/home/remote/jhrozek/devel/sssd/src/tests/cmocka',
'-I/home/remote/jhrozek/devel/sssd/src/tools',
'-I/home/remote/jhrozek/devel/sssd/src/tools/common',
'-I/home/remote/jhrozek/devel/sssd/src/util',
'-I/home/remote/jhrozek/devel/sssd/src/util/crypto',
'-I/home/remote/jhrozek/devel/sssd/src/util/crypto/nss',
]

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = GetCompilationInfoForFile( filename )
    if not compilation_info:
      return None

    final_flags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_ )
  else:
    relative_to = DirectoryOfThisScript()
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }
