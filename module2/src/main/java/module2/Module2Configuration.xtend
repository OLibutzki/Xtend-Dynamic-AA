package module2

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class Module2Configuration {

	@Bean
	def Module2StringProcessor toStringProcessor() {
		return new Module2StringProcessor
	}

}
