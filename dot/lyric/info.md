# Using gamdl for Apple music
```
gamdl --synced-lyrics-format lrc --log-file /storage/emulated/0/Download/ap_pl/apl_log.md
```
# Example of a playlist
```
gamdl --synced-lyrics-format lrc --log-file /storage/emulated/0/Download/ap_pl/apl_log.md "https://music.apple.com/in/playlist/1/pl.u-aZb0NJ4FR3Zl64P?ls"
```
# For moving all files from a nested dir to another dir
```
fd -e m4a -e lrc . /storage/emulated/0/Download/ap_pl/ -x mv {} /storage/emulated/0/apl/
```
# For joining .lrc to .m4a must have same names i.e. .m4a file name and .lrc file name
```
python lrcput.py -d "/storage/emulated/0/apl/" -r
```

# python pkgs for lrc.py
```
pip install gamdl tqdm eyed3
```