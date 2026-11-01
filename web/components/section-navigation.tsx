import { ArrowLeftIcon, ArrowRightIcon, HomeIcon } from "lucide-react"

type SectionNavigationProps = {
  previous?: { href: string; label: string }
  next?: { href: string; label: string }
}

export function SectionNavigation({ previous, next }: SectionNavigationProps) {
  return (
    <nav aria-label="Navegación entre secciones" className="grid grid-cols-3 items-center gap-3 pt-1">
      <div className="justify-self-start">
        {previous ? <a href={previous.href} className="inline-flex items-center gap-2 rounded-lg border px-3 py-2 text-sm font-semibold text-emerald-800 transition hover:bg-emerald-50"><ArrowLeftIcon className="size-4" /><span className="hidden sm:inline">{previous.label}</span></a> : null}
      </div>
      <a href="/dashboard" aria-label="Volver al menú principal" title="Menú principal" className="inline-flex size-10 justify-self-center items-center justify-center rounded-lg border text-emerald-800 transition hover:bg-emerald-50 focus-visible:ring-2 focus-visible:ring-emerald-600 focus-visible:outline-none"><HomeIcon className="size-5" /></a>
      <div className="justify-self-end">
        {next ? <a href={next.href} className="inline-flex items-center gap-2 rounded-lg border px-3 py-2 text-sm font-semibold text-emerald-800 transition hover:bg-emerald-50"><span className="hidden sm:inline">{next.label}</span><ArrowRightIcon className="size-4" /></a> : null}
      </div>
    </nav>
  )
}
