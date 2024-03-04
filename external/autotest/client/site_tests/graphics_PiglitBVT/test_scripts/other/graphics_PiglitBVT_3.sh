#!/bin/bash


need_pass=291
failures=0
PIGLIT_PATH=/usr/local/piglit/lib64/piglit/
export PIGLIT_SOURCE_DIR=/usr/local/piglit/lib64/piglit/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PIGLIT_PATH/lib
export DISPLAY=:0
export XAUTHORITY=/home/chronos/.Xauthority


function run_test()
{
  local name="$1"
  local time="$2"
  local command="$3"
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "+ Running test [$name] of expected runtime $time sec: [$command]"
  sync
  $command
  if [ $? == 0 ] ; then
    let "need_pass--"
    echo "+ pass :: $name"
  else
    let "failures++"
    echo "+ fail :: $name"
  fi
}


pushd $PIGLIT_PATH
run_test "shaders/glsl-max-varyings >MAX_VARYING_COMPONENTS" 0.0 "bin/glsl-max-varyings --exceed-limits -fbo -auto"
run_test "shaders/glsl-max-vertex-attrib" 0.0 "bin/glsl-max-vertex-attrib -fbo -auto"
run_test "shaders/glsl-novertexdata" 0.0 "bin/glsl-novertexdata -fbo -auto"
run_test "shaders/glsl-octal" 0.0 "bin/shader_runner tests/shaders/glsl-octal.shader_test -auto"
run_test "shaders/glsl-orangebook-ch06-bump" 0.0 "bin/glsl-orangebook-ch06-bump -fbo -auto"
run_test "shaders/glsl-override-builtin" 0.0 "bin/shader_runner tests/shaders/glsl-override-builtin.shader_test -auto"
run_test "shaders/glsl-override-builtin-2" 0.0 "bin/shader_runner tests/shaders/glsl-override-builtin-2.shader_test -auto"
run_test "shaders/glsl-pp-elif-no-expression-1" 0.0 "bin/shader_runner tests/shaders/glsl-pp-elif-no-expression-1.shader_test -auto"
run_test "shaders/glsl-precision-110" 0.0 "bin/shader_runner tests/shaders/glsl-precision-110.shader_test -auto"
run_test "shaders/glsl-preprocessor-comments" 0.0 "bin/glsl-preprocessor-comments -fbo -auto"
run_test "shaders/glsl-reload-source" 0.0 "bin/glsl-reload-source -fbo -auto"
run_test "shaders/glsl-sin" 0.0 "bin/glsl-sin -fbo -auto"
run_test "shaders/glsl-struct-constructor-01" 0.0 "bin/shader_runner tests/shaders/glsl-struct-constructor-01.shader_test -auto"
run_test "shaders/glsl-texcoord-array-2" 0.0 "bin/shader_runner tests/shaders/glsl-texcoord-array-2.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-1" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-1.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-2" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-2.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-3" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-3.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-4" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-4.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-5" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-5.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-6" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-6.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-7" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-7.shader_test -auto"
run_test "shaders/glsl-uniform-linking-1" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-linking-1.shader_test -auto"
run_test "shaders/glsl-uniform-non-uniform-array-compare" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-non-uniform-array-compare.shader_test -auto"
run_test "shaders/glsl-uniform-out-of-bounds" 0.0 "bin/glsl-uniform-out-of-bounds -fbo -auto"
run_test "shaders/glsl-uniform-out-of-bounds-2" 0.0 "bin/glsl-uniform-out-of-bounds-2 -fbo -auto"
run_test "shaders/glsl-uniform-struct" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-struct.shader_test -auto"
run_test "shaders/glsl-uniform-update" 0.0 "bin/glsl-uniform-update -fbo -auto"
run_test "shaders/glsl-unused-varying" 0.0 "bin/glsl-unused-varying -fbo -auto"
run_test "shaders/glsl-useprogram-displaylist" 0.0 "bin/glsl-useprogram-displaylist -fbo -auto"
run_test "shaders/glsl-varying-mat3x2" 0.0 "bin/shader_runner tests/shaders/glsl-varying-mat3x2.shader_test -auto"
run_test "shaders/glsl-varying-read" 0.0 "bin/shader_runner tests/shaders/glsl-varying-read.shader_test -auto"
run_test "shaders/glsl-vec-array" 0.0 "bin/shader_runner tests/shaders/glsl-vec-array.shader_test -auto"
run_test "shaders/glsl-vs-abs-attribute" 0.0 "bin/shader_runner tests/shaders/glsl-vs-abs-attribute.shader_test -auto"
run_test "shaders/glsl-vs-abs-neg" 0.0 "bin/shader_runner tests/shaders/glsl-vs-abs-neg.shader_test -auto"
run_test "shaders/glsl-vs-abs-neg-with-intermediate" 0.0 "bin/shader_runner tests/shaders/glsl-vs-abs-neg-with-intermediate.shader_test -auto"
run_test "shaders/glsl-vs-all-01" 0.0 "bin/shader_runner tests/shaders/glsl-vs-all-01.shader_test -auto"
run_test "shaders/glsl-vs-all-02" 0.0 "bin/shader_runner tests/shaders/glsl-vs-all-02.shader_test -auto"
run_test "shaders/glsl-vs-array-redeclaration" 0.0 "bin/shader_runner tests/shaders/glsl-vs-array-redeclaration.shader_test -auto"
run_test "shaders/glsl-vs-arrays" 0.0 "bin/glsl-vs-arrays -fbo -auto"
run_test "shaders/glsl-vs-arrays-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-arrays-2.shader_test -auto"
run_test "shaders/glsl-vs-arrays-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-arrays-3.shader_test -auto"
run_test "shaders/glsl-vs-channel-overwrite-01" 0.0 "bin/shader_runner tests/shaders/glsl-vs-channel-overwrite-01.shader_test -auto"
run_test "shaders/glsl-vs-channel-overwrite-02" 0.0 "bin/shader_runner tests/shaders/glsl-vs-channel-overwrite-02.shader_test -auto"
run_test "shaders/glsl-vs-channel-overwrite-03" 0.0 "bin/shader_runner tests/shaders/glsl-vs-channel-overwrite-03.shader_test -auto"
run_test "shaders/glsl-vs-channel-overwrite-04" 0.0 "bin/shader_runner tests/shaders/glsl-vs-channel-overwrite-04.shader_test -auto"
run_test "shaders/glsl-vs-clamp-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-clamp-1.shader_test -auto"
run_test "shaders/glsl-vs-constructor-call" 0.0 "bin/shader_runner tests/shaders/glsl-vs-constructor-call.shader_test -auto"
run_test "shaders/glsl-vs-continue-in-switch-in-do-while" 0.0 "bin/shader_runner tests/shaders/glsl-vs-continue-in-switch-in-do-while.shader_test -auto"
run_test "shaders/glsl-vs-continue-inside-do-while" 0.0 "bin/shader_runner tests/shaders/glsl-vs-continue-inside-do-while.shader_test -auto"
run_test "shaders/glsl-vs-copy-propagation-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-copy-propagation-1.shader_test -auto"
run_test "shaders/glsl-vs-cross" 0.0 "bin/shader_runner tests/shaders/glsl-vs-cross.shader_test -auto"
run_test "shaders/glsl-vs-cross-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-cross-2.shader_test -auto"
run_test "shaders/glsl-vs-cross-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-cross-3.shader_test -auto"
run_test "shaders/glsl-vs-deadcode-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-deadcode-1.shader_test -auto"
run_test "shaders/glsl-vs-deadcode-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-deadcode-2.shader_test -auto"
run_test "shaders/glsl-vs-dot-vec2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-dot-vec2.shader_test -auto"
run_test "shaders/glsl-vs-double-negative-copy-propagation" 0.0 "bin/shader_runner tests/shaders/glsl-vs-double-negative-copy-propagation.shader_test -auto"
run_test "shaders/glsl-vs-f2b" 0.0 "bin/shader_runner tests/shaders/glsl-vs-f2b.shader_test -auto"
run_test "shaders/glsl-vs-ff-frag" 0.0 "bin/shader_runner tests/shaders/glsl-vs-ff-frag.shader_test -auto"
run_test "shaders/glsl-vs-functions" 0.0 "bin/glsl-vs-functions -fbo -auto"
run_test "shaders/glsl-vs-functions-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-functions-2.shader_test -auto"
run_test "shaders/glsl-vs-functions-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-functions-3.shader_test -auto"
run_test "shaders/glsl-vs-if-bool" 0.0 "bin/glsl-vs-if-bool -fbo -auto"
run_test "shaders/glsl-vs-if-greater" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-greater.shader_test -auto"
run_test "shaders/glsl-vs-if-greater-equal" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-greater-equal.shader_test -auto"
run_test "shaders/glsl-vs-if-less" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-less.shader_test -auto"
run_test "shaders/glsl-vs-if-less-equal" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-less-equal.shader_test -auto"
run_test "shaders/glsl-vs-if-nested" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-nested.shader_test -auto"
run_test "shaders/glsl-vs-if-nested-loop" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-nested-loop.shader_test -auto"
run_test "shaders/glsl-vs-large-uniform-array" 0.0 "bin/shader_runner tests/shaders/glsl-vs-large-uniform-array.shader_test -auto"
run_test "shaders/glsl-vs-loop" 0.0 "bin/glsl-vs-loop -fbo -auto"
run_test "shaders/glsl-vs-loop-300" 0.0 "bin/shader_runner tests/shaders/glsl-vs-loop-300.shader_test -auto"
run_test "shaders/glsl-vs-loop-break" 0.0 "bin/shader_runner tests/shaders/glsl-vs-loop-break.shader_test -auto"
run_test "shaders/glsl-vs-loop-continue" 0.0 "bin/shader_runner tests/shaders/glsl-vs-loop-continue.shader_test -auto"
run_test "shaders/glsl-vs-loop-nested" 0.0 "bin/glsl-vs-loop-nested -fbo -auto"
run_test "shaders/glsl-vs-loop-redundant-condition" 0.0 "bin/shader_runner tests/shaders/glsl-vs-loop-redundant-condition.shader_test -auto"
run_test "shaders/glsl-vs-main-return" 0.0 "bin/shader_runner tests/shaders/glsl-vs-main-return.shader_test -auto"
run_test "shaders/glsl-vs-masked-cos" 0.0 "bin/shader_runner tests/shaders/glsl-vs-masked-cos.shader_test -auto"
run_test "shaders/glsl-vs-masked-dot" 0.0 "bin/shader_runner tests/shaders/glsl-vs-masked-dot.shader_test -auto"
run_test "shaders/glsl-vs-mat-add-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-add-1.shader_test -auto"
run_test "shaders/glsl-vs-mat-div-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-div-1.shader_test -auto"
run_test "shaders/glsl-vs-mat-div-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-div-2.shader_test -auto"
run_test "shaders/glsl-vs-mat-mul-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-mul-1.shader_test -auto"
run_test "shaders/glsl-vs-mat-mul-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-mul-2.shader_test -auto"
run_test "shaders/glsl-vs-mat-mul-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-mul-3.shader_test -auto"
run_test "shaders/glsl-vs-mat-sub-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-sub-1.shader_test -auto"
run_test "shaders/glsl-vs-max-array-access-forward-declaration" 0.0 "bin/shader_runner tests/shaders/glsl-vs-max-array-access-forward-declaration.shader_test -auto"
run_test "shaders/glsl-vs-max-array-access-function" 0.0 "bin/shader_runner tests/shaders/glsl-vs-max-array-access-function.shader_test -auto"
run_test "shaders/glsl-vs-mov-after-deref" 0.0 "bin/glsl-vs-mov-after-deref -fbo -auto"
run_test "shaders/glsl-vs-mvp-statechange" 0.0 "bin/glsl-vs-mvp-statechange -fbo -auto"
run_test "shaders/glsl-vs-neg-abs" 0.0 "bin/shader_runner tests/shaders/glsl-vs-neg-abs.shader_test -auto"
run_test "shaders/glsl-vs-neg-attribute" 0.0 "bin/shader_runner tests/shaders/glsl-vs-neg-attribute.shader_test -auto"
run_test "shaders/glsl-vs-normalscale" 0.0 "bin/glsl-vs-normalscale -fbo -auto"
run_test "shaders/glsl-vs-point-size" 0.0 "bin/glsl-vs-point-size -fbo -auto"
run_test "shaders/glsl-vs-position-outval" 0.0 "bin/shader_runner tests/shaders/glsl-vs-position-outval.shader_test -auto"
run_test "shaders/glsl-vs-post-increment-01" 0.0 "bin/shader_runner tests/shaders/glsl-vs-post-increment-01.shader_test -auto"
run_test "shaders/glsl-vs-raytrace-bug26691" 0.0 "bin/glsl-vs-raytrace-bug26691 -fbo -auto"
run_test "shaders/glsl-vs-sign" 0.0 "bin/shader_runner tests/shaders/glsl-vs-sign.shader_test -auto"
run_test "shaders/glsl-vs-statechange-1" 0.0 "bin/glsl-vs-statechange-1 -fbo -auto"
run_test "shaders/glsl-vs-swizzle-swizzle-lhs" 0.0 "bin/shader_runner tests/shaders/glsl-vs-swizzle-swizzle-lhs.shader_test -auto"
run_test "shaders/glsl-vs-swizzle-swizzle-rhs" 0.0 "bin/shader_runner tests/shaders/glsl-vs-swizzle-swizzle-rhs.shader_test -auto"
run_test "shaders/glsl-vs-texturematrix-1" 0.0 "bin/glsl-vs-texturematrix-1 -fbo -auto"
run_test "shaders/glsl-vs-texturematrix-2" 0.0 "bin/glsl-vs-texturematrix-2 -fbo -auto"
run_test "shaders/glsl-vs-uniform-array-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-uniform-array-1.shader_test -auto"
run_test "shaders/glsl-vs-uniform-array-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-uniform-array-2.shader_test -auto"
run_test "shaders/glsl-vs-uniform-array-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-uniform-array-3.shader_test -auto"
run_test "shaders/glsl-vs-uniform-array-4" 0.0 "bin/shader_runner tests/shaders/glsl-vs-uniform-array-4.shader_test -auto"
run_test "shaders/glsl-vs-user-varying-ff" 0.0 "bin/glsl-vs-user-varying-ff -fbo -auto"
run_test "shaders/glsl-vs-varying-array" 0.0 "bin/shader_runner tests/shaders/glsl-vs-varying-array.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-1.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-2.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-3.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-4" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-4.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-5" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-5.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-6" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-6.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-temp-dst" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-temp-dst.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-temp-dst-in-loop" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-temp-dst-in-loop.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-temp-dst-in-nested-loop-combined" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-temp-dst-in-nested-loop-combined.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-temp-src" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-temp-src.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-temp-src-in-loop" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-temp-src-in-loop.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-temp-src-in-nested-loop-combined" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-temp-src-in-nested-loop-combined.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-temp-src-in-nested-loop-inner" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-temp-src-in-nested-loop-inner.shader_test -auto"
run_test "shaders/glsl-vs-vec4-indexing-temp-src-in-nested-loop-outer" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-indexing-temp-src-in-nested-loop-outer.shader_test -auto"
run_test "shaders/glsl-vs-vec4-operator-equal" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-operator-equal.shader_test -auto"
run_test "shaders/glsl-vs-vec4-operator-notequal" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vec4-operator-notequal.shader_test -auto"
run_test "shaders/glsl-vs-vectorize-between-basic-blocks" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vectorize-between-basic-blocks.shader_test -auto"
run_test "shaders/glsl-vs-vectorize-between-basic-blocks-loop" 0.0 "bin/shader_runner tests/shaders/glsl-vs-vectorize-between-basic-blocks-loop.shader_test -auto"
run_test "shaders/link-struct-usage" 0.0 "bin/shader_runner tests/shaders/link-struct-usage.shader_test -auto"
run_test "shaders/link-uniform-array-size" 0.0 "bin/shader_runner tests/shaders/link-uniform-array-size.shader_test -auto"
run_test "shaders/link-unresolved-function" 0.0 "bin/link-unresolved-function -fbo -auto"
run_test "shaders/loopfunc" 0.0 "bin/shader_runner tests/shaders/loopfunc.shader_test -auto"
run_test "shaders/out-parameter-indexing/vs-inout-vec4" 0.0 "bin/shader_runner tests/shaders/out-parameter-indexing/vs-inout-vec4.shader_test -auto"
run_test "shaders/out-parameter-indexing/vs-out-vec4" 0.0 "bin/shader_runner tests/shaders/out-parameter-indexing/vs-out-vec4.shader_test -auto"
run_test "shaders/really-big-triangle" 0.0 "bin/shader_runner tests/shaders/really-big-triangle.shader_test -auto"
run_test "shaders/useprogram-flushverts-1" 0.0 "bin/useprogram-flushverts-1 -fbo -auto"
run_test "shaders/useprogram-flushverts-2" 0.0 "bin/useprogram-flushverts-2 -fbo -auto"
run_test "shaders/useprogram-inside-begin" 0.0 "bin/useprogram-inside-begin -fbo -auto"
run_test "shaders/useprogram-refcount-1" 0.0 "bin/useprogram-refcount-1 -fbo -auto"
run_test "shaders/vbo/vbo-generic-float" 0.0 "bin/shader_runner tests/shaders/vbo/vbo-generic-float.shader_test -auto"
run_test "shaders/vbo/vbo-generic-int" 0.0 "bin/shader_runner tests/shaders/vbo/vbo-generic-int.shader_test -auto"
run_test "shaders/vbo/vbo-generic-uint" 0.0 "bin/shader_runner tests/shaders/vbo/vbo-generic-uint.shader_test -auto"
run_test "shaders/vp-combined-image-units" 0.0 "bin/vp-combined-image-units -fbo -auto"
run_test "shaders/vp-ignore-input" 0.0 "bin/vp-ignore-input -fbo -auto"
run_test "spec/!OpenGL 1.0/gl-1.0-beginend-coverage" 0.0 "bin/gl-1.0-beginend-coverage -fbo -auto"
run_test "spec/!OpenGL 1.0/gl-1.0-dlist-beginend" 0.0 "bin/gl-1.0-dlist-beginend -fbo -auto"
run_test "spec/!OpenGL 1.0/gl-1.0-dlist-shademodel" 0.0 "bin/gl-1.0-dlist-shademodel -fbo -auto"
run_test "spec/!OpenGL 1.0/gl-1.0-edgeflag" 0.0 "bin/gl-1.0-edgeflag -fbo -auto"
run_test "spec/!OpenGL 1.0/gl-1.0-edgeflag-const" 0.0 "bin/gl-1.0-edgeflag-const -fbo -auto"
run_test "spec/!OpenGL 1.0/gl-1.0-front-invalidate-back" 0.0 "bin/gl-1.0-front-invalidate-back -auto"
run_test "spec/!OpenGL 1.0/gl-1.0-long-dlist" 0.0 "bin/gl-1.0-long-dlist -fbo -auto"
run_test "spec/!OpenGL 1.0/gl-1.0-rendermode-feedback" 0.0 "bin/gl-1.0-rendermode-feedback -fbo -auto"
run_test "spec/!OpenGL 1.0/gl-1.0-swapbuffers-behavior" 0.0 "bin/gl-1.0-swapbuffers-behavior -auto"
run_test "spec/!OpenGL 1.1/GL_SELECT - alpha-test enabled" 0.0 "bin/select alpha"
run_test "spec/!OpenGL 1.1/GL_SELECT - depth-test enabled" 0.0 "bin/select depth"
run_test "spec/!OpenGL 1.1/GL_SELECT - no test function" 0.0 "bin/select gl11"
run_test "spec/!OpenGL 1.1/GL_SELECT - scissor-test enabled" 0.0 "bin/select scissor"
run_test "spec/!OpenGL 1.1/GL_SELECT - stencil-test enabled" 0.0 "bin/select stencil"
run_test "spec/!OpenGL 1.1/array-stride" 0.0 "bin/array-stride -auto"
run_test "spec/!OpenGL 1.1/clear-accum" 0.0 "bin/clear-accum -auto"
run_test "spec/!OpenGL 1.1/clipflat" 0.0 "bin/clipflat -fbo -auto"
run_test "spec/!OpenGL 1.1/copypixels-draw-sync" 0.0 "bin/copypixels-draw-sync -auto"
run_test "spec/!OpenGL 1.1/copypixels-sync" 0.0 "bin/copypixels-sync -auto"
run_test "spec/!OpenGL 1.1/copyteximage 1D" 0.0 "bin/copyteximage -auto 1D"
run_test "spec/!OpenGL 1.1/copyteximage-border" 0.0 "bin/copyteximage-border -auto"
run_test "spec/!OpenGL 1.1/copyteximage-clipping" 0.0 "bin/copyteximage-clipping -auto"
run_test "spec/!OpenGL 1.1/copytexsubimage" 0.0 "bin/copytexsubimage -auto"
run_test "spec/!OpenGL 1.1/degenerate-prims" 0.0 "bin/degenerate-prims -auto"
run_test "spec/!OpenGL 1.1/depthfunc" 0.0 "bin/depthfunc -auto"
run_test "spec/!OpenGL 1.1/depthstencil-default_fb-blit" 0.0 "bin/fbo-depthstencil blit default_fb -auto"
run_test "spec/!OpenGL 1.1/depthstencil-default_fb-copypixels" 0.0 "bin/fbo-depthstencil copypixels default_fb -auto"
run_test "spec/!OpenGL 1.1/depthstencil-default_fb-drawpixels-24_8" 0.0 "bin/fbo-depthstencil drawpixels default_fb 24_8 -auto"
run_test "spec/!OpenGL 1.1/depthstencil-default_fb-drawpixels-32F_24_8_REV" 0.0 "bin/fbo-depthstencil drawpixels default_fb 32F_24_8_REV -auto"
run_test "spec/!OpenGL 1.1/depthstencil-default_fb-drawpixels-FLOAT-and-USHORT" 0.0 "bin/fbo-depthstencil drawpixels default_fb FLOAT-and-USHORT -auto"
run_test "spec/!OpenGL 1.1/depthstencil-default_fb-readpixels-24_8" 0.0 "bin/fbo-depthstencil readpixels default_fb 24_8 -auto"
run_test "spec/!OpenGL 1.1/depthstencil-default_fb-readpixels-32F_24_8_REV" 0.0 "bin/fbo-depthstencil readpixels default_fb 32F_24_8_REV -auto"
run_test "spec/!OpenGL 1.1/depthstencil-default_fb-readpixels-FLOAT-and-USHORT" 0.0 "bin/fbo-depthstencil readpixels default_fb FLOAT-and-USHORT -auto"
run_test "spec/!OpenGL 1.1/dlist-clear" 0.0 "bin/dlist-clear -auto"
run_test "spec/!OpenGL 1.1/dlist-color-material" 0.0 "bin/dlist-color-material -auto"
run_test "spec/!OpenGL 1.1/dlist-fdo3129-01" 0.0 "bin/dlist-fdo3129-01 -auto"
run_test "spec/!OpenGL 1.1/dlist-fdo3129-02" 0.0 "bin/dlist-fdo3129-02 -auto"
run_test "spec/!OpenGL 1.1/draw-arrays-colormaterial" 0.0 "bin/draw-arrays-colormaterial -auto"
run_test "spec/!OpenGL 1.1/draw-copypixels-sync" 0.0 "bin/draw-copypixels-sync -auto"
run_test "spec/!OpenGL 1.1/drawbuffer-modes" 0.0 "bin/drawbuffer-modes -auto"
run_test "spec/!OpenGL 1.1/fdo10370" 0.0 "bin/fdo10370 -auto"
run_test "spec/!OpenGL 1.1/fdo23489" 0.0 "bin/fdo23489 -auto"
run_test "spec/!OpenGL 1.1/fdo23670-depth_test" 0.0 "bin/fdo23670-depth_test -auto"
run_test "spec/!OpenGL 1.1/fdo23670-drawpix_stencil" 0.0 "bin/fdo23670-drawpix_stencil -auto"
run_test "spec/!OpenGL 1.1/fog-modes" 0.0 "bin/fog-modes -auto"
run_test "spec/!OpenGL 1.1/fragment-center" 0.0 "bin/fragment-center -auto"
run_test "spec/!OpenGL 1.1/geterror-inside-begin" 0.0 "bin/geterror-inside-begin -auto"
run_test "spec/!OpenGL 1.1/geterror-invalid-enum" 0.0 "bin/geterror-invalid-enum -auto"
run_test "spec/!OpenGL 1.1/getteximage-luminance" 0.0 "bin/getteximage-luminance -auto"
run_test "spec/!OpenGL 1.1/getteximage-simple" 0.0 "bin/getteximage-simple -auto"
run_test "spec/!OpenGL 1.1/getteximage-targets 1D" 0.0 "bin/getteximage-targets 1D -fbo -auto"
run_test "spec/!OpenGL 1.1/getteximage-targets 2D" 0.0 "bin/getteximage-targets 2D -fbo -auto"
run_test "spec/!OpenGL 1.1/glinfo" 0.0 "bin/glinfo -fbo -auto"
run_test "spec/!OpenGL 1.1/incomplete-texture-fixed" 0.0 "bin/incomplete-texture -auto fixed -fbo -auto"
run_test "spec/!OpenGL 1.1/infinite-spot-light" 0.0 "bin/infinite-spot-light -auto"
run_test "spec/!OpenGL 1.1/masked-clear" 0.0 "bin/masked-clear -fbo -auto"
run_test "spec/!OpenGL 1.1/max-texture-size-level" 0.0 "bin/max-texture-size-level -fbo -auto"
run_test "spec/!OpenGL 1.1/point-line-no-cull" 0.0 "bin/point-line-no-cull -auto"
run_test "spec/!OpenGL 1.1/polygon-mode" 0.0 "bin/polygon-mode -auto"
run_test "spec/!OpenGL 1.1/proxy-texture" 0.0 "bin/proxy-texture -fbo -auto"
run_test "spec/!OpenGL 1.1/push-pop-texture-state" 0.0 "bin/push-pop-texture-state -fbo -auto"
run_test "spec/!OpenGL 1.1/quad-invariance" 0.0 "bin/quad-invariance -fbo -auto"
run_test "spec/!OpenGL 1.1/r300-readcache" 0.0 "bin/r300-readcache -auto"
run_test "spec/!OpenGL 1.1/read-front" 0.0 "bin/read-front -auto"
run_test "spec/!OpenGL 1.1/read-front clear-front-first" 0.0 "bin/read-front clear-front-first -auto"
run_test "spec/!OpenGL 1.1/roundmode-getintegerv" 0.0 "bin/roundmode-getintegerv -auto"
run_test "spec/!OpenGL 1.1/roundmode-pixelstore" 0.0 "bin/roundmode-pixelstore -auto"
run_test "spec/!OpenGL 1.1/scissor-bitmap" 0.0 "bin/scissor-bitmap -auto"
run_test "spec/!OpenGL 1.1/scissor-clear" 0.0 "bin/scissor-clear -auto"
run_test "spec/!OpenGL 1.1/scissor-copypixels" 0.0 "bin/scissor-copypixels -auto"
run_test "spec/!OpenGL 1.1/scissor-depth-clear" 0.0 "bin/scissor-depth-clear -auto"
run_test "spec/!OpenGL 1.1/scissor-many" 0.0 "bin/scissor-many -auto"
run_test "spec/!OpenGL 1.1/scissor-offscreen" 0.0 "bin/scissor-offscreen -auto"
run_test "spec/!OpenGL 1.1/scissor-polygon" 0.0 "bin/scissor-polygon -fbo -auto"
run_test "spec/!OpenGL 1.1/scissor-stencil-clear" 0.0 "bin/scissor-stencil-clear -auto"
run_test "spec/!OpenGL 1.1/sized-texture-format-channels" 0.0 "bin/sized-texture-format-channels -fbo -auto"
run_test "spec/!OpenGL 1.1/stencil-drawpixels" 0.0 "bin/stencil-drawpixels -auto"
run_test "spec/!OpenGL 1.1/texgen" 0.0 "bin/texgen -auto"
run_test "spec/!OpenGL 1.1/texredefine" 0.0 "bin/texredefine -auto"
run_test "spec/!OpenGL 1.1/texsubimage" 0.0 "bin/texsubimage -auto"
run_test "spec/!OpenGL 1.1/texture-al" 0.0 "bin/texture-al -auto"
run_test "spec/!OpenGL 1.1/texwrap 1D" 0.0 "bin/texwrap 1D GL_RGBA8 -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap 1D bordercolor" 0.0 "bin/texwrap 1D GL_RGBA8 bordercolor -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap 1D proj" 0.0 "bin/texwrap 1D GL_RGBA8 proj -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap 1D proj bordercolor" 0.0 "bin/texwrap 1D GL_RGBA8 proj bordercolor -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap 2D" 0.0 "bin/texwrap 2D GL_RGBA8 -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap 2D bordercolor" 0.0 "bin/texwrap 2D GL_RGBA8 bordercolor -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap 2D proj" 0.0 "bin/texwrap 2D GL_RGBA8 proj -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap 2D proj bordercolor" 0.0 "bin/texwrap 2D GL_RGBA8 proj bordercolor -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap formats" 0.0 "bin/texwrap -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap formats bordercolor" 0.0 "bin/texwrap bordercolor -fbo -auto"
run_test "spec/!OpenGL 1.1/texwrap formats bordercolor-swizzled" 0.0 "bin/texwrap bordercolor swizzled -fbo -auto"
run_test "spec/!OpenGL 1.1/tri-tex-crash" 0.0 "bin/tri-tex-crash -auto"
run_test "spec/!OpenGL 1.1/triangle-guardband-viewport" 0.0 "bin/triangle-guardband-viewport -fbo -auto"
run_test "spec/!OpenGL 1.1/two-sided-lighting" 0.0 "bin/two-sided-lighting -auto"
run_test "spec/!OpenGL 1.1/user-clip" 0.0 "bin/user-clip -auto"
run_test "spec/!OpenGL 1.1/varray-disabled" 0.0 "bin/varray-disabled -auto"
run_test "spec/!OpenGL 1.1/vbo-buffer-unmap" 0.0 "bin/vbo-buffer-unmap -auto"
run_test "spec/!OpenGL 1.2/copyteximage 3D" 0.0 "bin/copyteximage 3D -auto"
run_test "spec/!OpenGL 1.2/crash-texparameter-before-teximage" 0.0 "bin/crash-texparameter-before-teximage -auto"
run_test "spec/!OpenGL 1.2/draw-elements-vs-inputs" 0.0 "bin/draw-elements-vs-inputs -auto"
run_test "spec/!OpenGL 1.2/getteximage-targets 3D" 0.0 "bin/getteximage-targets 3D -fbo -auto"
run_test "spec/!OpenGL 1.2/levelclamp" 0.0 "bin/levelclamp -auto"
run_test "spec/!OpenGL 1.2/lodclamp" 0.0 "bin/lodclamp -auto"
run_test "spec/!OpenGL 1.2/lodclamp-between" 0.0 "bin/lodclamp-between -auto"
run_test "spec/!OpenGL 1.2/lodclamp-between-max" 0.0 "bin/lodclamp-between-max -auto"
run_test "spec/!OpenGL 1.2/mipmap-setup" 0.0 "bin/mipmap-setup -auto"
run_test "spec/!OpenGL 1.2/tex-skipped-unit" 0.0 "bin/tex-skipped-unit -auto"
run_test "spec/!OpenGL 1.2/tex3d" 0.0 "bin/tex3d -auto"
run_test "spec/!OpenGL 1.2/texwrap 3D" 0.0 "bin/texwrap 3D GL_RGBA8 -fbo -auto"
run_test "spec/!OpenGL 1.2/texwrap 3D bordercolor" 0.0 "bin/texwrap 3D GL_RGBA8 bordercolor -fbo -auto"
run_test "spec/!OpenGL 1.2/texwrap 3D proj" 0.0 "bin/texwrap 3D GL_RGBA8 proj -fbo -auto"
run_test "spec/!OpenGL 1.2/texwrap 3D proj bordercolor" 0.0 "bin/texwrap 3D GL_RGBA8 proj bordercolor -fbo -auto"
run_test "spec/!OpenGL 1.2/two-sided-lighting-separate-specular" 0.0 "bin/two-sided-lighting-separate-specular -auto"
run_test "spec/!OpenGL 1.3/tex-border-1" 0.0 "bin/tex-border-1 -auto"
run_test "spec/!OpenGL 1.3/tex3d-depth1" 0.0 "bin/tex3d-depth1 -fbo -auto"
run_test "spec/!OpenGL 1.3/texunits" 0.0 "bin/texunits -auto"
run_test "spec/!OpenGL 1.4/blendminmax" 0.0 "bin/blendminmax -auto"
run_test "spec/!OpenGL 1.4/blendsquare" 0.0 "bin/blendsquare -auto"
run_test "spec/!OpenGL 1.4/copy-pixels" 0.0 "bin/copy-pixels -auto"
run_test "spec/!OpenGL 1.4/draw-batch" 0.0 "bin/draw-batch -auto"
run_test "spec/!OpenGL 1.4/gl-1.4-dlist-multidrawarrays" 0.0 "bin/gl-1.4-dlist-multidrawarrays -fbo -auto"
run_test "spec/!OpenGL 1.4/stencil-wrap" 0.0 "bin/stencil-wrap -auto"
run_test "spec/!OpenGL 1.4/tex-miplevel-selection" 0.0 "bin/tex-miplevel-selection -nobias -nolod -fbo -auto"
run_test "spec/!OpenGL 1.4/tex-miplevel-selection-lod" 0.0 "bin/tex-miplevel-selection -nobias -fbo -auto"
run_test "spec/!OpenGL 1.4/tex-miplevel-selection-lod-bias" 0.0 "bin/tex-miplevel-selection -fbo -auto"
run_test "spec/!OpenGL 1.4/tex1d-2dborder" 0.0 "bin/tex1d-2dborder -auto"
run_test "spec/!OpenGL 1.4/triangle-rasterization" 0.0 "bin/triangle-rasterization -auto"
run_test "spec/!OpenGL 1.4/triangle-rasterization-fbo" 0.0 "bin/triangle-rasterization -auto -use_fbo"
run_test "spec/!OpenGL 1.4/triangle-rasterization-overdraw" 0.0 "bin/triangle-rasterization-overdraw -auto"
run_test "spec/!OpenGL 1.5/depth-tex-compare" 0.0 "bin/depth-tex-compare -auto"
run_test "spec/!OpenGL 1.5/draw-elements" 0.0 "bin/draw-elements -auto"
run_test "spec/!OpenGL 1.5/draw-elements-user" 0.0 "bin/draw-elements -auto user"
run_test "spec/!OpenGL 1.5/draw-vertices" 0.0 "bin/draw-vertices -auto"
run_test "spec/!OpenGL 1.5/draw-vertices-user" 0.0 "bin/draw-vertices -auto user"
run_test "spec/!OpenGL 1.5/isbufferobj" 0.0 "bin/isbufferobj -auto"
run_test "spec/!OpenGL 2.0/attrib-assignments" 0.0 "bin/attrib-assignments -auto"
run_test "spec/!OpenGL 2.0/attribs" 0.0 "bin/attribs -fbo -auto"
run_test "spec/!OpenGL 2.0/clear-varray-2.0" 0.0 "bin/clear-varray-2.0 -auto"
run_test "spec/!OpenGL 2.0/clip-flag-behavior" 0.0 "bin/clip-flag-behavior -auto"
run_test "spec/!OpenGL 2.0/depth-tex-modes-glsl" 0.0 "bin/depth-tex-modes-glsl -auto"
run_test "spec/!OpenGL 2.0/fragment-and-vertex-texturing" 0.0 "bin/fragment-and-vertex-texturing -auto"
run_test "spec/!OpenGL 2.0/getattriblocation-conventional" 0.0 "bin/getattriblocation-conventional -auto"
run_test "spec/!OpenGL 2.0/gl-2.0-edgeflag" 0.0 "bin/gl-2.0-edgeflag -fbo -auto"
run_test "spec/!OpenGL 2.0/gl-2.0-edgeflag-immediate" 0.0 "bin/gl-2.0-edgeflag-immediate -fbo -auto"
run_test "spec/!OpenGL 2.0/gl-2.0-vertexattribpointer" 0.0 "bin/gl-2.0-vertexattribpointer -fbo -auto"
run_test "spec/!OpenGL 2.0/incomplete-texture-glsl" 0.0 "bin/incomplete-texture -auto glsl -fbo -auto"
run_test "spec/!OpenGL 2.0/max-samplers" 0.0 "bin/max-samplers -fbo -auto"
popd

if [ $need_pass == 0 ] ; then
  echo "+---------------------------------------------+"
  echo "| Overall pass, as all 291 tests have passed. |"
  echo "+---------------------------------------------+"
else
  echo "+-----------------------------------------------------------+"
  echo "| Overall failure, as $need_pass tests did not pass and $failures failed. |"
  echo "+-----------------------------------------------------------+"
fi
exit $need_pass
