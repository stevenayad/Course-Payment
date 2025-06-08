allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Use provider to defer evaluation
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build")

subprojects {
    // Set new build directory for each subproject
    layout.buildDirectory.set(newBuildDir.map { it.dir(name) })

    evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(layout.buildDirectory)
}
