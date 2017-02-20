package module1test

import module1.ToString
import org.eclipse.xtend.core.compiler.batch.XtendCompilerTester
import org.junit.Test

class ToStringAnnotationTest {

	extension XtendCompilerTester compilerTester = XtendCompilerTester.newXtendCompilerTester(ToString.classLoader)

	@Test
	def void testCompiler() {
		'''
			import «ToString.name»
			
			@«ToString.simpleName»
			class MyClass {
			    
			}
		'''.assertCompilesTo(
        '''
			import «ToString.name»;
			
			@«ToString.simpleName»
			@SuppressWarnings("all")
			public class MyClass {
			  public String toString() {
			    return "Module1 implementation";
			  }
			}
		''')
	}

}

