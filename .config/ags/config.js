const time = Variable('', {
    poll: [1000, function() {
        return Date().toString()
    }],
})

const battery = await Service.import('battery')

const Bar = (/** @type {number} */ monitor) => Widget.Window({
    monitor,
    name: `bar${monitor}`,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
        start_widget: Widget.Label({
            hpack: 'center',
            label: 'Welcome to AGS!',
        }),
        end_widget: Widget.Label({
            hpack: 'center',
            label: time.bind(),
        }),
	    batteryWidget: Widget.Label({
		hpack: 'center',
		    label: battery,
	    }),
    }),
})

App.config({
    windows: [Bar(0)],
})
