package module1

import java.util.List
import org.eclipse.xtend.lib.macro.AbstractClassProcessor
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.TransformationParticipant
import org.eclipse.xtend.lib.macro.declaration.MutableClassDeclaration

class ToStringProcessorDispatcher extends AbstractClassProcessor {

	public static TransformationParticipant transformationParticipant = {
		val processorClassName = Helper.getProcessorClassName(ToStringProcessorDispatcher.classLoader)
		Class.forName(processorClassName).newInstance as TransformationParticipant
	}

	override doTransform(List<? extends MutableClassDeclaration> annotatedClasses, extension TransformationContext context) {
		transformationParticipant.doTransform(annotatedClasses, context)
	}

}
