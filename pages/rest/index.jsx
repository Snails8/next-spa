import React from "react";
import {Button, Card, Col, Container, Nav, Row} from "react-bootstrap";
import Layout from "../../src/components/_layouts/Layout";
import {useRequireLogin} from "../../src/hooks/useRequireLogin";
import RestIndex from "../../src/components/rest";


const Home = () => {
  useRequireLogin();

  return (
      <>
        <Layout>
          <Col md="10" className="border">
            <RestIndex data={users}/>
          </Col>

        </Layout>
      </>
  )
}

export default Home

export async function getServerSideProps(ctx) {

  let users = null

  try {
    const res = await fetch(process.env.API_URL + '/api/hr_admin/users', {
      headers: {
        cookie: ctx.req.headers.cookie
      }
    })
    users = await res.json()
  } catch (e) {
    console.log(e)
  }

  return {
    props: {
      users: users
    }
  }
}