rarities = [
	{
		name: 'Common'
		enchantDust: 40
		enchantDustGolden: 400
		disenchantDust: 5
		disenchantDustGolden: 50 }
	{
		name: 'Rare'
		enchantDust: 100
		enchantDustGolden: 800
		disenchantDust: 20
		disenchantDustGolden: 100 }
	{
		name: 'Epic'
		enchantDust: 400
		enchantDustGolden: 1600
		disenchantDust: 100
		disenchantDustGolden: 400 }
	{
		name: 'Legendary'
		enchantDust: 1600
		enchantDustGolden: 3200
		disenchantDust: 400
		disenchantDustGolden: 1600 }
]


Template.table.helpers
	rarities: -> rarities
	normalCount: -> Session.get "#{@name}-normal-count"
	goldenCount: -> Session.get "#{@name}-golden-count"
	total: ->
		dust = 0
		for rarity in rarities
			normalCount = Session.get("#{rarity.name}-normal-count")
			goldenCount = Session.get("#{rarity.name}-golden-count")
			dust += rarity.disenchantDust * normalCount + rarity.disenchantDustGolden * goldenCount
		dust

Template.table.events
	'click .normal.count': -> Session.setPersistent "#{@name}-normal-count", Session.get("#{@name}-normal-count") + 1
	'click .golden.count': -> Session.setPersistent "#{@name}-golden-count", Session.get("#{@name}-golden-count") + 1
	'contextmenu .normal.count': (event) ->
		event.preventDefault()
		currentCount = Session.get("#{@name}-normal-count")
		if currentCount > 0 then Session.setPersistent "#{@name}-normal-count", currentCount - 1
	'contextmenu .golden.count': (event) ->
		event.preventDefault()
		currentCount = Session.get("#{@name}-golden-count")
		if currentCount > 0 then Session.setPersistent "#{@name}-golden-count", currentCount - 1

Meteor.startup ->
	for rarity in rarities
		Session.setDefaultPersistent "#{rarity.name}-normal-count", 0
		Session.setDefaultPersistent "#{rarity.name}-golden-count", 0
