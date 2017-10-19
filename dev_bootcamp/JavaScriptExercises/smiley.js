// Happy or sad
// Write a program with a smileymethod that accepts a hash as an argument. If the hash element with the key "mood" has the value "happy", then return ":)". If it has the value "sad", return ":(". Otherwise, return ":|".

function smiley(mood_options) {
	if (mood_options['mood'] === 'happy') {
		return ':)'
	} else if (mood_options['mood'] === 'sad') {
		return ':('
	} else {
		return ':|'
	}
};