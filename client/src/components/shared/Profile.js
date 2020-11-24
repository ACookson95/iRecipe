import React from 'react';
import { AuthConsumer } from "../../providers/AuthProvider";
import { Link, withRouter } from 'react-router-dom';
import { Header, } from 'semantic-ui-react';
import { Button } from 'semantic-ui-react';

class Profile extends React.Component {

  render() {
    const { auth: { handleLogout, } } = this.props
    return(
      <div>
        <Header as="h3" textAlign="center">My Profile</Header>
        <Button onClick={ () => handleLogout(this.props.history) }>Log Out</Button>
      </div>
    )
  }
}

export class ConnectedProfile extends React.Component {
  render() {
    return (
      <AuthConsumer>
        {auth =>
          <Profile {...this.props} auth={auth} />
        }
      </AuthConsumer>
    )
  }
}

export default withRouter(ConnectedProfile)