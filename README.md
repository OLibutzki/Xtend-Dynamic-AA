# Structure

module1 provides an annotation module1.ToString which is bound to the annotation processor module1.ToStringProcessorDispatcher. This processor holds a Spring application context in a static variable called *applicationContext*. The concrete processor implementation is provided by Spring. The default implementation is module1.Module1StringProcessor which generates a toString method which returns "Module1 implementation" statically.

module2 provides module2.Module2StringProcessor as annotation processor. The class is bound via Spring boot auto configuration. The processor generates a toString method which returns "Module2 implementation" statically.

Both modules (1 and 2) have a unit test to show the expected behaviour (module1test.ToStringAnnotationTest/module2test.ToStringAnnotationTest).

Additionally module3 is an example client which has a dependendy to module2. Therefore class annotated with @ToString have a toString method which returns "Module2 implementation".

module4 just has a dependency to module1 and @ToString annotated class havea toString mthod which returns "Module1 implementation".

# Eclipse
In Eclipse this setup works pretty well. The Unit-Tests pass and the toString methods of module3.MyClass and module4.MyClass are generated as expected.

# Maven 
In Maven this works too, but for compiling the Xtend classes of module3 and module4 I had to pass the dependencies to module1/module2 to the xtend-maven-plugin. It has not been enough to have the compile dependency.

I hope you get an idea of what I would like to achieve. In my opinion this solution seems to be quite ugly as I can not control the lifecycle of the Spring application context which is just stored in a static variable.
I really would like to see Xtend providing some help/API for scenarios like these.

