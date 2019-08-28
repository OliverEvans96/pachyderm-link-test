# Overview

Run `script.sh`. It first runs `create-data.sh`, which produces a directory called `data` consisting of 10,000 files containing `sha1sum`s in the following structure:

```
data
├── 0
│   ├── 0000
│   ├── 0001
│   ├── 0002
│   ...
│   └── 0999
├── 1
│   ├── 1000
│   ├── 1001
│   ├── 1002
│   ...
│   └── 1999
├── 2
│   ├── 2000
│   ├── 2001
│   ├── 2002
│   ...
│   └── 2999
...
└── 9
    ├── 9000
    ├── 9001
    ├── 9002
    ...
    └── 9999

10 directories, 10000 files
```

Then, it creates a repo called `data` and recursively fills it with the contents of the `data` directory.

The pipeline takes all the `%04d` files and combines them into a single directory in the output commit: `combine-data@master:/combined/`. A log with timestamps and the output of `time` is stored at `combine-data@master:/time.log`.

# A strange error...

The pipeline terminates in failure after the user code has completed with a strange error...

From `user.log`:

```
{"pipelineName":"combine-data","jobId":"927eac71af434e679082a987be27a18c","workerId":"pipeline-combine-data-v14-44crc","datumId":"e3b1cb94b3590f2b5a0fd47975975c5cedb76dcfee6e5919c6e6338c20da6fe2","data":[{"path":"/","hash":"NBe+3gHOsRdakDLqXivN7n/Lwbiv4CyELCZN3lmx+OY="}],"ts":"2019-08-28T23:05:43.792990962Z","message":"errored uploading output after 10.934178ms: error walking output: os.Open(/pfs/.scratch/e6b6f46413aa4174beb4768c3633e002/out/combined/0000): open /pfs/.scratch/e6b6f46413aa4174beb4768c3633e002/out/combined/0000: no such file or directory"}
{"pipelineName":"combine-data","jobId":"927eac71af434e679082a987be27a18c","workerId":"pipeline-combine-data-v14-44crc","datumId":"e3b1cb94b3590f2b5a0fd47975975c5cedb76dcfee6e5919c6e6338c20da6fe2","data":[{"path":"/","hash":"NBe+3gHOsRdakDLqXivN7n/Lwbiv4CyELCZN3lmx+OY="}],"ts":"2019-08-28T23:05:44.213193730Z","message":"failed to process datum with error: error walking output: os.Open(/pfs/.scratch/e6b6f46413aa4174beb4768c3633e002/out/combined/0000): open /pfs/.scratch/e6b6f46413aa4174beb4768c3633e002/out/combined/0000: no such file or directory"}
{"pipelineName":"combine-data","workerId":"pipeline-combine-data-v14-44crc","ts":"2019-08-28T23:05:46.072960318Z","message":"starting to merge chunk"}
{"pipelineName":"combine-data","workerId":"pipeline-combine-data-v14-44crc","ts":"2019-08-28T23:05:46.134747916Z","message":"finished merging chunk after 61.617336ms"}
{"pipelineName":"combine-data","workerId":"pipeline-combine-data-v14-44crc","ts":"2019-08-28T23:05:46.142215046Z","message":"starting to merge output"}
{"pipelineName":"combine-data","workerId":"pipeline-combine-data-v14-44crc","ts":"2019-08-28T23:05:46.614405830Z","message":"finished merging output after 471.960727ms"}
{"pipelineName":"combine-data","workerId":"pipeline-combine-data-v14-44crc","ts":"2019-08-28T23:05:46.636278135Z","message":"job \"927eac71af434e679082a987be27a18c\" put in terminal state \"JOB_FAILURE\"; cancelling"}
{"pipelineName":"combine-data","workerId":"pipeline-combine-data-v14-44crc","master":true,"ts":"2019-08-28T23:05:46.680753139Z","message":"error in waitJob context canceled, retrying in 461.576101ms"}
{"pipelineName":"combine-data","workerId":"pipeline-combine-data-v14-44crc","master":true,"ts":"2019-08-28T23:05:46.711520852Z","message":"master: error running the pipeline master process: commit 3d9878386a324749b7e13110913aed16 not found in repo combine-data; retrying in 7.535405005s"}
{"pipelineName":"combine-data","workerId":"pipeline-combine-data-v14-44crc","master":true,"ts":"2019-08-28T23:05:54.250971286Z","message":"Launching pipeline master process"}
```
