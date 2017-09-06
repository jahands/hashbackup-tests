```
hb1954 init -c .
cp ../dest.conf . # dest containing a, b, c
hb1954 dest sync -c .
# turn off dest a
hb1954 backup ~/stage -c .
rm arc.0.0 # Remove from cache
# turn on dest a
rm ../dests/b/arc.0.0
```
`hb1954 dest sync -c .`
### Output:
```
HashBackup build #1954 Copyright 2009-2017 HashBackup, LLC
Using destinations in dest.conf
Writing hb.db.2
Copied hb.db.2 to a (7.8 KB 0s 70 KB/s)
Copied hb.db.2 to c (7.8 KB 0s 69 KB/s)
Copied hb.db.2 to b (7.8 KB 0s 15 KB/s)
Getting arc.0.0
dest b: file not on destination: arc.0.0: No such file or directory
dest b: substituting empty file: /home/jh/hb-test/dest-sync/hb/arc.0.0
Traceback (most recent call last):
File "/hb.py", line 138, in <module>
File "/destcmd.py", line 113, in main
File "/destcmd.py", line 85, in dosync
File "/dest.py", line 930, in sync
File "/arc.py", line 448, in __init__
Exception: Error opening archive: Archive is incomplete (reading header): /home/jh/hb-test/dest-sync/hb/arc.0.0: /home/jh/hb-test/dest-sync/hb/arc.0.0
```

## NOTE
In 1951, running a second sync here would result in arc.0.0 being deleted from all destinations. However, in 1954 it gives the same error as above. Then, when you run dest verify (shown below), it fixes itself.

`hb1954 dest verify -c .`
### Output:
```
HashBackup build #1954 Copyright 2009-2017 HashBackup, LLC
Using destinations in dest.conf
Verifying files
b(dir): file not found verifying file: arc.0.0
Verified hb.db.2 on b
Verified hb.db.2 on c
Verified hb.db.2 on a
Verified arc.0.0 on c
Verify finished, running sync
Getting arc.0.0
Copied arc.0.0 to b (41 MB 0s 595 MB/s)
Copied arc.0.0 to a (41 MB 0s 546 MB/s)
Copied dest.db to c (32 KB 0s 5.2 MB/s)
Copied dest.db to a (32 KB 0s 2.9 MB/s)
Copied dest.db to b (32 KB 0s 2.0 MB/s)
Removed hb.db.1 from b
Removed hb.db.0 from b
Removed hb.db.0 from c
Removed hb.db.0 from a
Removed hb.db.1 from a
Removed hb.db.1 from c
Sync finished
------------------------------------------------------------
~/hb-test/dest-sync/hb » ls -lh ../dests/*/arc*
-rw-r--r-- 1 jh jh 40M Sep  6 12:18 ../dests/a/arc.0.0
-rw-r--r-- 1 jh jh 40M Sep  6 12:18 ../dests/b/arc.0.0
-rw-r--r-- 1 jh jh 40M Sep  6 12:16 ../dests/c/arc.0.0
```
