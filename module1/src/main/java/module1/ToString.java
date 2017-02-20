package module1;

import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import org.eclipse.xtend.lib.macro.Active;

@Retention( RUNTIME )
@Target( { TYPE } )
@Active( ToStringProcessorDispatcher.class )
public @interface ToString {

}
