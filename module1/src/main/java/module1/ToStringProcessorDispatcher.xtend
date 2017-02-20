package module1

import org.eclipse.xtend.lib.macro.AbstractClassProcessor
import org.eclipse.xtend.lib.macro.declaration.MutableClassDeclaration
import org.eclipse.xtend.lib.macro.TransformationContext
import org.springframework.boot.SpringApplication
import org.springframework.context.ConfigurableApplicationContext
import org.eclipse.xtend.lib.macro.TransformationParticipant
import java.util.List

class ToStringProcessorDispatcher extends AbstractClassProcessor{
	
	private static ConfigurableApplicationContext applicationContext = SpringApplication.run(Module1Configuration)
	
	override doTransform(List<? extends MutableClassDeclaration> annotatedClasses, extension TransformationContext context) {
		val toStringProcessor = applicationContext.getBean("toStringProcessor", TransformationParticipant)
		toStringProcessor.doTransform(annotatedClasses, context)
	}

	
}