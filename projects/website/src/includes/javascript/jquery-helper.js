/**
 * helper.js
 *
 * Collection of helper functions for jQuery
 */

/**
 *  Returns the text from the HTML tag based on the strSelector
 * @param {string} strSelector - Include necessary HTML tags and ID to select the right HTML tag
 */
function jQueryReadTextfromHTML(strSelector) {
	var text = $(validateString(strSelector)).text();
	return validateString(text);
}

/**
 *  Returns the value from the HTML tag based on the strSelector. The attribute must be value
 * @param {string} strSelector - Include necessary HTML tags and ID to select the right HTML tag
 */
function jQueryReadValfromHTML(strSelector) {
	var value = $(validateString(strSelector)).val();
	return validateString(value);
}

/**
 * Writes the text to the HTML tag based on the strSelector
 * @param {string} strSelector - Include necessary HTML tags and ID to select the right HTML tag
 * @param {string} strText - Text to replace the HTML tag
 */
function jQueryWriteTextToHTML(strSelector, strText) {
	$(validateString(strSelector)).text(validateString(strText));
	$(validateString(strSelector)).show();
}

/**
 * Writes the value to the HTML tag based on the strSelector. The attribute must be value
 * @param {string} strSelector - Include necessary HTML tags and ID to select the right HTML tag
 * @param {string} strVal - Value to replace the HTML tag
 */
function jQueryWriteValToHTML(strSelector, strVal) {
	$(validateString(strSelector)).val(validateString(strVal));
}

/**
 * Replaces the HTML text based based on ID
 * @param {string} strSelector - Include necessary HTML tags and ID to select the right HTML tag
 * @param {string} htmlText
 */
function jQueryWriteToHTML(strSelector, htmlText) {
	$(validateString(strSelector)).html(validateString(htmlText));
	$(validateString(strSelector)).show();
}

/**
 * Creates a link to the webpage by writing to the HTML tag based on ID
 * @param {string} strSelector - Include necessary HTML tags and ID to select the right HTML tag
 * @param {string} destination - .php or .html page that exists
 * @param {string} email - Params specified by email
 * @param {string} htmlText - HTML text to put in-between <a></a>
 */
function jQueryGenerateURL(strSelector, destination, email, htmlText) {
	htmlResult = '';
	urlLink = validateString(destination) + "?email=" + validateString(email);

	htmlResult += '<div>';
	htmlResult += '<a href="' + urlLink + '">';
	htmlResult += validateString(htmlText);
	htmlResult += '</a>';
	htmlResult += '</div>';

	jQueryWriteToHTML(strSelector, htmlResult);
}
