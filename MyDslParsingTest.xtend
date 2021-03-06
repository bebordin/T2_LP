/*
 * generated by Xtext 2.16.0
 */
package org.xtext.example.mydsl.tests

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith
import org.xtext.example.mydsl.myDsl.Model

@ExtendWith(InjectionExtension)
@InjectWith(MyDslInjectorProvider)
class SchemeParsingTest {
	@Inject
	ParseHelper<Model> parseHelper

	@Test
	def void expression1() {
		val result = parseHelper.parse('''
			+5 - 4 - 2 (+ 55)
		''')
		//source: https://repl.it/@doan_clark/Scheme
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: �errors.join(", ")�''')
	}

	@Test
	def void expression2() {
		val result = parseHelper.parse('''
			(+ 5 ( + 5))
		''')
		//source: http://www.shido.info/lisp/scheme2_e.html
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: �errors.join(", ")�''')
		
	}

	@Test
	def void Number() {
		val result = parseHelper.parse('''
			5
		''')
		//source https://repl.it/@doan_clark/Scheme
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: �errors.join(", ")�''')
	}

	@Test
	def void NumberWFuncSquare() {
		val result = parseHelper.parse('''
			(square 5)
		''')
		//source https://repl.it/@doan_clark/Scheme
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: �errors.join(", ")�''')
	}


	@Test
	def void Comments() {
		val result = parseHelper.parse('''
			;; ahusdhwuahduawdSADHSADUAHWD 234234 23WSFDSADF SA d
		''')
		//source http://www.shido.info/lisp/scheme2_e.html
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: �errors.join(", ")�''')
	}
	
	@Test
	def void DefineTest() {
		val result = parseHelper.parse('''
			(define (45+ x)
			  (+ y 2))
		''')
		Assertions.assertNotNull(result)
		//source http://people.cs.aau.dk/~normark/prog3-03/pdf/all.pdf
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
	}

	@Test
	def void testMultiplo() {
		val result = parseHelper.parse('''
			(/(/ (- 1 2 3) (+ 2 2 5)))
		''')
		//source http://people.cs.aau.dk/~normark/prog3-03/pdf/all.pdf
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
	}
	
	@Test
	def void listTest) {
		val result = parseHelper.parse('''
			(list 1 2 3)
		''')
		Assertions.assertNotNull(result)
		//source https://repl.it/@bburnham/Hour-of-Code-Scheme
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
}




}
