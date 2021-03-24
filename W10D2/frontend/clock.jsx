import React from 'react';

class Clock extends React.Component {

constructor(props) {
    super(props);
    this.state = {
        time: new Date()
    
    }

    this.monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];

    this.dayNames = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 
    'Friday', 'Saturday'];

    this.tick = this.tick.bind(this);
}
    render (){
        return(
            <div>
                <h1>Clock</h1>
                <div  className = "clock">
                <p>Time: {this.state.time.getHours()}:
                    {this.state.time.getMinutes()}:
                    {this.state.time.getSeconds()}
                    <br/>
                    Date: {this.dayNames[this.state.time.getDay()]}:
                        {this.monthNames[this.state.time.getMonth()]}:
                        {this.state.time.getDate()}:
                        {this.state.time.getFullYear()}

                </p>
                </div>

            </div>

        );
    };

    tick (){
        this.setState({
            time: new Date()
        })
    };

    componentDidMount() {
        var interval = setInterval(this.tick, 1000)
        
    };

    componentWillUnmount() {
        clearInterval(interval)
    }
}









export default Clock;