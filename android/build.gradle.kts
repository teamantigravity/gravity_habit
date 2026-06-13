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
            
            // Force compileSdkVersion to 36 to resolve plugin incompatibilities
            try {
                val setCompileSdk = androidExt.javaClass.methods.find { it.name == "setCompileSdk" }
                setCompileSdk?.invoke(androidExt, 36)
            } catch (e: Exception) {
                try {
                    val setCompileSdkVersion = androidExt.javaClass.methods.find { it.name == "setCompileSdkVersion" && it.parameterTypes.isNotEmpty() && it.parameterTypes[0].name == "int" }
                    setCompileSdkVersion?.invoke(androidExt, 36)
                } catch (e2: Exception) {}
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
