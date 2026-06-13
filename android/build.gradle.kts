allprojects {
    repositories {
        google()
        mavenCentral()
    }
}



val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    
    afterEvaluate {
        val androidExt = project.extensions.findByName("android")
        if (androidExt != null) {
            val namespaceGetter = androidExt.javaClass.methods.find { it.name == "getNamespace" }
            if (namespaceGetter?.invoke(androidExt) == null) {
                val namespaceSetter = androidExt.javaClass.methods.find { it.name == "setNamespace" }
                namespaceSetter?.invoke(androidExt, project.group.toString())
            }
        }
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
