theme
{
	name = "modern"

	view = view.small

	background
	{
		color = {{ palette[theme].base }}
		opacity = 100
		// effect = 2
	}

	item
	{
		opacity = 100

		prefix = 1

		text
		{
			normal = {{ palette[theme].text }}
			select = {{ palette[theme].text }}
			normal-disabled = {{ palette[theme].subtext0 }}
			select-disabled = {{ palette[theme].subtext0 }}
		}

		back
		{
			select = {{ palette[theme].surface1 }}
			select-disabled = {{ palette[theme].surface0 }}
		}
	}

	font
	{
		size = 14
		name = "{{ font }}"
		weight = 2
		italic = 0
	}

	border
	{
		enabled = true
		size = 1
		color = {{ palette[theme][accent] }}
		opacity = 100
		radius = 2
	}

	shadow
	{
		enabled = true
		size = 5
		opacity = 5
		color = {{ palette[theme].crust }}
	}

	separator
	{
		size = 1
		color = {{ palette[theme].surface0 }}
	}

	symbol
	{
		normal = {{ palette[theme][accent] }}
		select = {{ palette[theme][accent] }}
		normal-disabled = {{ palette[theme].subtext0 }}
		select-disabled = {{ palette[theme].subtext0 }}
	}

	image
	{
		enabled = true
		color = [{{ palette[theme].text }}, {{ palette[theme][accent] }}, {{ palette[theme].base }}]
	}
}