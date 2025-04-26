const time = Variable('', {
    poll: [1000, function() {
        return Date().toString()
    }],
})

const battery = await Service.import('battery');

const Bar = (/** @type {number} */ monitor) => Widget.Window({
    monitor,
    name: `bar${monitor}`,
    anchor: ['bottom', 'left', 'right'],
    exclusivity: 'exclusive',
   
    child: Widget.CenterBox({
        start_widget: Widget.Label({
            hpack: 'center',
            label: 'Welcome to AGS!',
        }),
	batt_widget: Widget.Label({
	    hpack: 'center',
	    label: battery,
	}),
        end_widget: Widget.Label({
            hpack: 'center',
            label: time.bind(),
        }),
    }),
})

App.config({
    windows: [Bar(0)],
})
