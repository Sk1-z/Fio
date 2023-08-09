
# Fio Documentation
---
## File system

### <span style="color:#c171ac">witho(path: string, mode: string?, modearg: string? | int?) -> string | nil</span>
- <span style="color:#c171ac">witho</span> opens the file designated by <span style="color:#00b0f0">path</span>. If a <span style="color:#00b0f0">path</span> argument is not provided, the function will return an error. If the file designated by the <span style="color:#00b0f0">path</span> does not exist and the mode is not <span style="color:#926868">"make"</span> the function will return an error. The default value of <span style="color:#00b0f0">mode</span> is <span style="color:#926868">"readall"</span>. If a <span style="color:#00b0f0">mode</span> requires an argument for <span style="color:#00b0f0">modearg</span> and one is not provide, the function will return an error.
- <span style="color:#926868">"readall"</span> returns a string containing the entirety of the files content
- <span style="color:#926868">"read"</span> will return the first <span style="color:#00b0f0">modearg</span> lines of the file
- <span style="color:#926868">"write"</span> will wipe the file and replace its contents with <span style="color:#00b0f0">modearg</span>
- <span style="color:#926868">"append"</span> will append <span style="color:#00b0f0">modearg</span> to the end of the file
- <span style="color:#926868">"make"</span> will create a new file at the <span style="color:#00b0f0">path</span> and fill it with <span style="color:#00b0f0">modearg</span> if it is not nil
---
## LuaSon
### <span style="color:#c171ac">parseFile(path : string) -> table</span>
- Returns the content of the file as a table if it follows proper JSON formatting. Line breaks are unimportant
### <span style="color:#c171ac">parseString(str : string) -> table</span>
- Returns the string as a table
### <span style="color:#c171ac">writeFile(t : table, path: string) -> nil</span>
- Writes the table as a JSON string to the file
### <span style="color:#c171ac">writeString(t: table) -> nil</span>
- Returns the table as a JSON string
