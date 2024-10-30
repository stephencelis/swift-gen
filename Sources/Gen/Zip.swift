#if swift(>=5.9)
/// Combines multiple generators into a single one that produces a tuple containing values from each input generator.
///
/// - Parameter gens: A variadic sequence of generators, each producing a value of a distinct type.
/// - Returns: A generator that produces a tuple of values generated by each input generator in the order they were provided.
@inlinable
public func zip<each Value>(_ gens: repeat Gen<each Value>) -> Gen<(repeat each Value)> {
  return Gen<(repeat each Value)> { rng in
    return (repeat (each gens)._run(&rng))
  }
}
#else
/// Combines two generators into a single one.
///
/// - Parameters:
///   - a: A generator of `A`s.
///   - b: A generator of `B`s.
/// - Returns: A generator of `(A, B)` pairs.
@inlinable
public func zip<A, B>(_ a: Gen<A>, _ b: Gen<B>) -> Gen<(A, B)> {
  return Gen<(A, B)> { rng in
    (a._run(&rng), b._run(&rng))
  }
}

@inlinable
public func zip<A, B, C>(
  _ a: Gen<A>,
  _ b: Gen<B>,
  _ c: Gen<C>
)
  -> Gen<(A, B, C)>
{
  return zip(zip(a, b), c).map { ($0.0, $0.1, $1) }
}

@inlinable
public func zip<A, B, C, D>(
  _ a: Gen<A>,
  _ b: Gen<B>,
  _ c: Gen<C>,
  _ d: Gen<D>
)
  -> Gen<(A, B, C, D)>
{
  return zip(zip(a, b), c, d).map { ($0.0, $0.1, $1, $2) }
}

@inlinable
public func zip<A, B, C, D, E>(
  _ a: Gen<A>,
  _ b: Gen<B>,
  _ c: Gen<C>,
  _ d: Gen<D>,
  _ e: Gen<E>
)
  -> Gen<(A, B, C, D, E)>
{
  return zip(zip(a, b), c, d, e).map { ($0.0, $0.1, $1, $2, $3) }
}

@inlinable
public func zip<A, B, C, D, E, F>(
  _ a: Gen<A>,
  _ b: Gen<B>,
  _ c: Gen<C>,
  _ d: Gen<D>,
  _ e: Gen<E>,
  _ f: Gen<F>
)
  -> Gen<(A, B, C, D, E, F)>
{
  return zip(zip(a, b), c, d, e, f).map { ($0.0, $0.1, $1, $2, $3, $4) }
}

@inlinable
public func zip<A, B, C, D, E, F, G>(
  _ a: Gen<A>,
  _ b: Gen<B>,
  _ c: Gen<C>,
  _ d: Gen<D>,
  _ e: Gen<E>,
  _ f: Gen<F>,
  _ g: Gen<G>
)
  -> Gen<(A, B, C, D, E, F, G)>
{
  return zip(zip(a, b), c, d, e, f, g).map { ($0.0, $0.1, $1, $2, $3, $4, $5) }
}

@inlinable
public func zip<A, B, C, D, E, F, G, H>(
  _ a: Gen<A>,
  _ b: Gen<B>,
  _ c: Gen<C>,
  _ d: Gen<D>,
  _ e: Gen<E>,
  _ f: Gen<F>,
  _ g: Gen<G>,
  _ h: Gen<H>
)
  -> Gen<(A, B, C, D, E, F, G, H)>
{
  return zip(zip(a, b), c, d, e, f, g, h).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6) }
}

@inlinable
public func zip<A, B, C, D, E, F, G, H, I>(
  _ a: Gen<A>,
  _ b: Gen<B>,
  _ c: Gen<C>,
  _ d: Gen<D>,
  _ e: Gen<E>,
  _ f: Gen<F>,
  _ g: Gen<G>,
  _ h: Gen<H>,
  _ i: Gen<I>
)
  -> Gen<(A, B, C, D, E, F, G, H, I)>
{
  return zip(zip(a, b), c, d, e, f, g, h, i).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6, $7) }
}

@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J>(
  _ a: Gen<A>,
  _ b: Gen<B>,
  _ c: Gen<C>,
  _ d: Gen<D>,
  _ e: Gen<E>,
  _ f: Gen<F>,
  _ g: Gen<G>,
  _ h: Gen<H>,
  _ i: Gen<I>,
  _ j: Gen<J>
)
  -> Gen<(A, B, C, D, E, F, G, H, I, J)>
{
  return zip(zip(a, b), c, d, e, f, g, h, i, j).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6, $7, $8) }
}
#endif
