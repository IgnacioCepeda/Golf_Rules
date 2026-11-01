import Image from "next/image"
import Link from "next/link"

export default function AboutPage() {
  return (
    <main className="flex min-h-full items-center justify-center bg-neutral-950 p-6 text-white">
      <section className="w-full max-w-xl rounded-2xl border border-white/10 bg-black p-8 shadow-2xl">
        <Image
          src="/la-liga-ycc-logo.png"
          alt="La Liga YCC"
          width={400}
          height={299}
          priority
          className="mx-auto h-auto w-52"
        />
        <div className="mt-8 border-t border-white/10 pt-6">
          <p className="text-sm font-medium tracking-[0.2em] text-emerald-300 uppercase">Acerca de</p>
          <h1 className="mt-2 text-3xl font-semibold">Reglas de Golf — La Liga</h1>
          <p className="mt-4 leading-7 text-neutral-300">Guía práctica para consultar las reglas y disfrutar mejor cada ronda.</p>
          <dl className="mt-6 space-y-3 text-sm">
            <div className="flex justify-between gap-4 border-b border-white/10 pb-3">
              <dt className="text-neutral-400">Versión</dt>
              <dd className="font-medium">0.8.0</dd>
            </div>
            <div className="flex justify-between gap-4">
              <dt className="text-neutral-400">Desarrollo</dt>
              <dd className="font-medium">Ignacio Cepeda</dd>
            </div>
          </dl>
        </div>
        <Link href="/dashboard" className="mt-8 inline-flex text-sm font-medium text-emerald-300 hover:text-emerald-200">
          ← Volver a la guía
        </Link>
      </section>
    </main>
  )
}
