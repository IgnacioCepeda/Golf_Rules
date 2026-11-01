import { AppSidebar } from "@/components/app-sidebar"
import { FieldGuide } from "@/components/field-guide"
import Image from "next/image"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb"
import { Separator } from "@/components/ui/separator"
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"

export default function Page() {
  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2 border-b px-4">
          <SidebarTrigger className="-ml-1" />
          <Separator
            orientation="vertical"
            className="mr-2 data-vertical:h-4 data-vertical:self-auto"
          />
          <Breadcrumb>
            <BreadcrumbList>
              <BreadcrumbItem className="hidden md:block">
                <BreadcrumbLink href="#">La Liga</BreadcrumbLink>
              </BreadcrumbItem>
              <BreadcrumbSeparator className="hidden md:block" />
              <BreadcrumbItem>
                <BreadcrumbPage>Guía de reglas</BreadcrumbPage>
              </BreadcrumbItem>
            </BreadcrumbList>
          </Breadcrumb>
        </header>
        <main className="flex flex-1 flex-col gap-6 p-4 md:p-8">
          <section className="grid overflow-hidden rounded-2xl bg-black text-emerald-50 md:grid-cols-[1fr_280px]">
            <div className="px-6 py-10 md:px-10">
              <p className="text-sm font-medium tracking-[0.2em] text-emerald-300 uppercase">La Liga YCC</p>
              <h1 className="mt-3 max-w-2xl text-3xl font-semibold tracking-tight md:text-5xl">Reglas claras para disfrutar mejor cada ronda.</h1>
              <p className="mt-4 max-w-xl text-base leading-7 text-emerald-100 md:text-lg">Consulta una situación de juego, entiende el procedimiento y juega con confianza.</p>
            </div>
            <div className="relative min-h-52 border-t border-white/10 md:min-h-full md:border-t-0 md:border-l">
              <Image
                src="/la-liga-ycc-logo.png"
                alt="La Liga YCC"
                fill
                priority
                sizes="(min-width: 768px) 280px, 100vw"
                className="object-contain p-5"
              />
            </div>
          </section>
          <section className="grid gap-4 md:grid-cols-3">
            <article className="rounded-xl border bg-card p-5 shadow-sm">
              <p className="text-sm font-medium text-muted-foreground">Primer objetivo</p>
              <h2 className="mt-2 text-xl font-semibold">Resolver en el campo</h2>
              <p className="mt-2 text-sm leading-6 text-muted-foreground">Fichas breves y visuales para situaciones frecuentes.</p>
            </article>
            <article className="rounded-xl border bg-card p-5 shadow-sm">
              <p className="text-sm font-medium text-muted-foreground">Contenido</p>
              <h2 className="mt-2 text-xl font-semibold">Reglamento actualizado</h2>
              <p className="mt-2 text-sm leading-6 text-muted-foreground">La taxonomía heredada se revisará con las Reglas de Golf vigentes.</p>
            </article>
            <article className="rounded-xl border bg-card p-5 shadow-sm">
              <p className="text-sm font-medium text-muted-foreground">Próximamente</p>
              <h2 className="mt-2 text-xl font-semibold">Búsqueda y favoritos</h2>
              <p className="mt-2 text-sm leading-6 text-muted-foreground">Acceso rápido a las reglas que más consulta el grupo.</p>
            </article>
          </section>
          <FieldGuide />
        </main>
      </SidebarInset>
    </SidebarProvider>
  )
}
