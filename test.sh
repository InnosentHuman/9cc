#!/bin/bash
assert() {
    expected="$1" #期待する出力
    input="$2"    #入力

    cc -o 9cc 9cc.c
    ./9cc "$input" > tmp.s
    cc -o tmp tmp.s
    ./tmp         #アセンブリ言語をコンパイルしたものの実行
    actual="$?"   #実際の出力

    if [ "$actual" = "$expected" ]; then
        echo "$input => $actual"
    else
        echo "$input => $expected expected, but got $actual"
        exit 1
    fi
}

assert 0 0
assert 42 42

echo OK