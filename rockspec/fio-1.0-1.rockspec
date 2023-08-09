package = "Fio"
version = "1.0-1"
source = {
   url = "git://github.com/Sk1-z/Fio",
   tag = "v1.0"
}
description = {
   summary = "Fio is a file module for lua",
   detailed = "Fio provides functions to serializing and deserializing Json along with an easier way to access files inspired by python",
   homepage = "https://github.com/Sk1-z/Fio"
}
dependencies = {
   -- List your dependencies here
    "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      Fio = "..\Fio.lua"
   }
}