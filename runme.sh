#! /bin/bash

SUBDIRS="aha-compress          \
          aha-mont64            \
          bs                    \
          bubblesort            \
          cnt                   \
          compress              \
          cover                 \
          crc                   \
          crc32                 \
          ctl                   \
          ctl-stack             \
          ctl-string            \
          ctl-vector            \
          cubic                 \
          dijkstra              \
          dtoa                  \
          duff                  \
          edn                   \
          expint                \
          fac                   \
          fasta                 \
          fdct                  \
          fibcall               \
          fir                   \
          frac                  \
          huffbench             \
          insertsort            \
          janne_complex         \
          jfdctint              \
          lcdnum                \
          levenshtein           \
          ludcmp                \
          matmult               \
          matmult-float         \
          matmult-int           \
          mergesort             \
          miniz                 \
          minver                \
          nbody                 \
          ndes                  \
          nettle-aes            \
          nettle-arcfour        \
          nettle-cast128        \
          nettle-des            \
          nettle-md5            \
          nettle-sha256         \
          newlib-exp            \
          newlib-log            \
          newlib-mod            \
          newlib-sqrt           \
          ns                    \
          nsichneu              \
          picojpeg              \
          prime                 \
          qrduino               \
          qsort                 \
          qurt                  \
          recursion             \
          rijndael              \
          select                \
          sglib-arraybinsearch  \
          sglib-arrayheapsort   \
          sglib-arrayquicksort  \
          sglib-arraysort       \
          sglib-dllist          \
          sglib-hashtable       \
          sglib-listinsertsort  \
          sglib-listsort        \
          sglib-queue           \
          sglib-rbtree          \
          slre                  \
          sqrt                  \
          st                    \
          statemate             \
          stb_perlin            \
          stringsearch1         \
          strstr                \
          tarai                 \
          template              \
          trio                  \
          trio-snprintf         \
          trio-sscanf           \
          ud                    \
          whetstone             \
          wikisort"

rm -rf vmems
mkdir -p vmems

for d in `find src/ -maxdepth 1 -type d` ; do
    echo $d
    benchname=$(basename $d)
    or1k-elf-objdump -D src/$benchname/$benchname > vmems/$benchname.dis
    or1k-elf-objcopy -O binary src/$benchname/$benchname vmems/$benchname.bin
    bin2vmem vmems/$benchname.bin > vmems/$benchname.vmem
done