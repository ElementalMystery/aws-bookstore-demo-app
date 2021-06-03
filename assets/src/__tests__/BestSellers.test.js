import React from 'react';
import BestSellers from '../modules/bestSellers/BestSellers';
import '@testing-library/jest-dom'
import { render } from '@testing-library/react'

it('BestSeller Header Validation', () => {
  const { getByText } = render(<BestSellers />);
  expect(getByText('Top 20 best sellers')).toBeInTheDocument();
});