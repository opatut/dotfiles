# Build YouCompleteMe

buildYcm() {
    DIR=$PWD
    cd YouCompleteMe
    mkdir ycm_build
    cd ycm_build
    cmake ../third_party/ycmd/cpp
    make -j4
    cd ../third_party/ycmd/third_party/tern_runtime 
    npm install --production
    cd $DIR
}

buildYcm
