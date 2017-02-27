package module1

import java.util.List
import org.eclipse.xtend.lib.macro.AbstractClassProcessor
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.TransformationParticipant
import org.eclipse.xtend.lib.macro.declaration.MutableClassDeclaration

class ToStringProcessorDispatcher extends AbstractClassProcessor {

	public static long duration;

	public static TransformationParticipant transformationParticipant = {
		val startTime = System.currentTimeMillis
		val processorClassName = Helper.getProcessorClassName(ToStringProcessorDispatcher.classLoader)
		val transformationParticipant = Class.forName(processorClassName).newInstance as TransformationParticipant
		duration = System.currentTimeMillis - startTime
		transformationParticipant
	}

	override doTransform(List<? extends MutableClassDeclaration> annotatedClasses, extension TransformationContext context) {
		transformationParticipant.doTransform(annotatedClasses, context)
	}

}
