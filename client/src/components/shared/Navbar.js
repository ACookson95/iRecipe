import React from 'react'
import { AuthConsumer, } from "../../providers/AuthProvider";
import { Menu, } from 'semantic-ui-react'
import { Link, withRouter, } from 'react-router-dom'
import Logo from '../resources/images/iRecipe_logo.svg'

class Navbar extends React.Component {
  
  rightNavItems = () => {
    const { auth: { user, }, location, } = this.props;
    
    if (user) {
      return (
        <Menu.Menu position='right'>
          <Link to='/profile'>
            <Menu.Item
              name='profile'
              active={location.pathname === '/profile'}
            />
          </Link>
        </Menu.Menu>
      )
    } else {
      return (
        <Menu.Menu position='right'>
          <Link to='/login'>
            <Menu.Item
              id='login'
              name='login'
              active={location.pathname === '/login'}
            />
          </Link>
          <Link to='/register'>
            <Menu.Item
              id='register'
              name='register'
              active={location.pathname === '/register'}
            />
          </Link>
        </Menu.Menu>
      )
    }
  }
  
  render() {
    return (
      <div>
        <Link to='/'>
          <div style={{ height: "75px", width: "500px"}}>
            <img 
              alt="logo"
              height="75px"
              src={Logo}
            />
          </div>
        </Link>
        <Menu pointing secondary>
            { this.rightNavItems() }
        </Menu>
      </div>
    )
  }
}

export class ConnectedNavbar extends React.Component {
  render() {
    return (
      <AuthConsumer> 
        { auth => 
          <Navbar { ...this.props } auth={auth} />
        }
      </AuthConsumer>
    )
  }
}

export default withRouter(ConnectedNavbar);