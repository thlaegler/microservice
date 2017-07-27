package com.laegler.microservice.adapter.util

import javax.inject.Singleton
import org.eclipse.xtend.lib.annotations.Accessors

@Singleton
@Accessors
class DiagramUtil {

	String dotColorRest = 'firebrick'
	String dotColorGrpc = 'dodgerblue'
	String dotColorJar = 'grey'
	String dotColorDraft = 'lightgrey'

	String umlColorRest = '#Red'
	String umlColorGrpc = '#Blue'
	String umlColorJar = '#Grey'
	String umlColorDraft = '#Lightgrey'

}
