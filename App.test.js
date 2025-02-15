// app.test.js
import {render, screen} from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import React from 'react'
import '@testing-library/jest-dom'
import {App, LocationDisplay} from './App'
import {BrowserRouter, MemoryRouter} from 'react-router-dom'

test('full app rendering/navigating', async () => {
  render(<App />, {wrapper: BrowserRouter})
  const user = userEvent.setup()

  // verify page content for default route
  expect(screen.getByText(/you are home/i)).toBeInTheDocument()

  // verify page content for expected route after navigating
  await user.click(screen.getByText(/about/i))
  expect(screen.getByText(/you are on the about page/i)).toBeInTheDocument()
})

test('landing on a bad page', () => {
  const badRoute = '/some/bad/route'

  // use <MemoryRouter> when you want to manually control the history
  render(
    <MemoryRouter initialEntries={[badRoute]}>
      <App />
    </MemoryRouter>,
  )

  // verify navigation to "no match" route
  expect(screen.getByText(/no match/i)).toBeInTheDocument()
})

test('rendering a component that uses useLocation', () => {
  const route = '/some-route'

  // use <MemoryRouter> when you want to manually control the history
  render(
    <MemoryRouter initialEntries={[route]}>
      <LocationDisplay />
    </MemoryRouter>,
  )

  // verify location display is rendered
  expect(screen.getByTestId('location-display')).toHaveTextContent(route)
})