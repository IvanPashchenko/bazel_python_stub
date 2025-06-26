# python toolchain is required by @@bazel_tools//tools/jdk:proguard_whitelister
# and there's no python:toolchain_type toolchain for aarch64 windows
# but python is not actually used, so we'll stub it
load("@rules_python//python:py_runtime_pair.bzl", "py_runtime_pair")
load("@rules_python//python:py_runtime.bzl", "py_runtime")
load("@bazel_tools//tools/python:toolchain.bzl")

py_runtime(
    name = "python_stub_runtime",
    files = [],
    interpreter_path = "/NO_INTERPRETER",
    python_version = "PY3",
)

py_runtime_pair(
    name = "py_stub_runtime_pair",
    py3_runtime = ":python_stub_runtime",
    py2_runtime = None,
)

toolchain(
    name = "py_stub_toolchain",
    toolchain_type = "@rules_python//python:toolchain_type",
    toolchain = ":py_stub_runtime_pair",
)