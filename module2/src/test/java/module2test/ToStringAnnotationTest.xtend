package module2test

import module1.ToString
import module2.Module2StringProcessor
import org.eclipse.xtend.core.compiler.batch.XtendCompilerTester
import org.junit.Test

class ToStringAnnotationTest {

	extension XtendCompilerTester compilerTester = XtendCompilerTester.newXtendCompilerTester(Module2StringProcessor.classLoader)

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
			    return "Module2 implementation";
			  }
			}
		''')
	}
}
