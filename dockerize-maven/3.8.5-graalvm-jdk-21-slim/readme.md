使用debian镜像出现了下面的错误
```
root@3405e4ccb850:/# native-image --version
Fatal error: unhandled exception in isolate 0x7f8b17480000: java.lang.NullPointerException: null
    at java.util.Objects.requireNonNull(Objects.java:233)
    at sun.nio.fs.UnixFileSystem.getPath(UnixFileSystem.java:296)
    at java.nio.file.Path.of(Path.java:148)
    at java.nio.file.Paths.get(Paths.java:69)
    at jdk.internal.platform.CgroupUtil.lambda$readStringValue$0(CgroupUtil.java:54)
    at java.security.AccessController.executePrivileged(AccessController.java:114)
    at java.security.AccessController.doPrivileged(AccessController.java:571)
    at jdk.internal.platform.CgroupUtil.readStringValue(CgroupUtil.java:56)
    at jdk.internal.platform.CgroupSubsystemController.getStringValue(CgroupSubsystemController.java:62)
    at jdk.internal.platform.CgroupSubsystemController.getLongValue(CgroupSubsystemController.java:121)
    at jdk.internal.platform.cgroupv1.CgroupV1Subsystem.getLongValue(CgroupV1Subsystem.java:190)
    at jdk.internal.platform.cgroupv1.CgroupV1Subsystem.getHierarchical(CgroupV1Subsystem.java:160)
    at jdk.internal.platform.cgroupv1.CgroupV1Subsystem.initSubSystem(CgroupV1Subsystem.java:85)
    at jdk.internal.platform.cgroupv1.CgroupV1Subsystem.getInstance(CgroupV1Subsystem.java:61)
    at jdk.internal.platform.CgroupSubsystemFactory.create(CgroupSubsystemFactory.java:89)
    at jdk.internal.platform.CgroupSubsystemFactory.create(CgroupSubsystemFactory.java:60)
    at jdk.internal.platform.CgroupMetrics.getInstance(CgroupMetrics.java:193)
    at jdk.internal.platform.SystemMetrics.instance(SystemMetrics.java:29)
    at jdk.internal.platform.Metrics.systemMetrics(Metrics.java:58)
    at jdk.internal.platform.Container.metrics(Container.java:43)
    at com.oracle.svm.core.Containers.memoryLimitInBytes(Containers.java:121)
    at com.oracle.svm.core.heap.PhysicalMemory.size(PhysicalMemory.java:92)
    at com.oracle.svm.core.graal.snippets.CEntryPointSnippets.initializeIsolate(CEntryPointSnippets.java:375)
    at com.oracle.svm.core.JavaMainWrapper$EnterCreateIsolateWithCArgumentsPrologue.enter(JavaMainWrapper.java:447)

```