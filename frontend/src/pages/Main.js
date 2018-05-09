import React, { Component } from 'react'
import { BrowserRouter as Router, Route } from 'react-router-dom'

import { Grid } from 'react-bootstrap'
import Intro from "../blocks/Intro";


// code
export default class Main extends Component {

    state = {
        page_text_content: []
    };

    async componentWillMount() {
        try {
            const text_content = await fetch('http://127.0.0.1:15201/?format=json');
            const page_text_content = await text_content.json();
            this.setState({page_text_content});
        } catch (e) {
            console.log(e);
        }
    }

    render() {
        return (
            <Router>
                <Grid fluid={true} className="head-margin">
                    <Intro page_text_content={this.state.page_text_content}/>
                </Grid>
            </Router>
        )
    }
}
