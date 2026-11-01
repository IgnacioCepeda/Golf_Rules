"use client"

import * as React from "react"
import Image from "next/image"

import { SearchForm } from "@/components/search-form"
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from "@/components/ui/collapsible"
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
  SidebarRail,
} from "@/components/ui/sidebar"
import { BookOpenCheckIcon, HeartIcon, MinusIcon, PlusIcon } from "lucide-react"

const data = {
  navMain: [
    {
      title: "Guía rápida",
      url: "#",
      items: [
        { title: "Cómo usar la guía", url: "#" },
        { title: "Antes de empezar", url: "#" },
      ],
    },
    {
      title: "Reglas por situación",
      url: "#",
      items: [
        { title: "Bases y dropear", url: "/dashboard/bases-y-dropear" },
        { title: "Mesas de salida", url: "/dashboard/mesa-de-salida" },
        { title: "Área general del campo", url: "/dashboard/area-general" },
        { title: "Bunker (trampas de arena)", url: "/dashboard/bunker" },
        { title: "Áreas de penalidad (lagos de agua)", url: "/dashboard/areas-de-penalizacion" },
        { title: "Fuera de límites y provisional", url: "#" },
        { title: "Green", url: "/dashboard/green" },
        { title: "Bola movida", url: "#" },
        { title: "Bola en movimiento", url: "#" },
      ],
    },
  ],
}
export function AppSidebar({ ...props }: React.ComponentProps<typeof Sidebar>) {
  return (
    <Sidebar {...props}>
      <SidebarHeader>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton size="lg" render={<a href="/dashboard" />}>
              <div className="relative aspect-square size-8 overflow-hidden rounded-lg bg-black">
                <Image
                  src="/la-liga-ycc-logo.png"
                  alt="Logo de La Liga YCC"
                  fill
                  sizes="32px"
                  className="object-cover object-[50%_30%]"
                />
              </div>
              <div className="flex flex-col gap-0.5 leading-none">
                <span className="font-semibold">La Liga</span>
                <span>Reglas de Golf</span>
              </div>
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
        <SearchForm />
      </SidebarHeader>
      <SidebarContent>
        <SidebarGroup>
          <SidebarMenu>
            {data.navMain.map((item, index) => (
              <Collapsible
                key={item.title}
                defaultOpen={index === 1}
                className="group/collapsible"
              >
                <SidebarMenuItem>
                  <SidebarMenuButton render={<CollapsibleTrigger />}>
                    {item.title}{" "}
                    <PlusIcon className="ml-auto group-aria-expanded/menu-button:hidden" />
                    <MinusIcon className="ml-auto hidden group-aria-expanded/menu-button:block" />
                  </SidebarMenuButton>
                  {item.items?.length ? (
                    <CollapsibleContent>
                      <SidebarMenuSub>
                        {item.items.map((item) => (
                          <SidebarMenuSubItem key={item.title}>
                            <SidebarMenuSubButton
                              render={<a href={item.url} />}
                            >
                              {item.title}
                            </SidebarMenuSubButton>
                          </SidebarMenuSubItem>
                        ))}
                      </SidebarMenuSub>
                    </CollapsibleContent>
                  ) : null}
                </SidebarMenuItem>
              </Collapsible>
            ))}
          </SidebarMenu>
        </SidebarGroup>
      </SidebarContent>
      <SidebarFooter>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton render={<a href="#" />}>
              <BookOpenCheckIcon />
              Reglamento actualizado
            </SidebarMenuButton>
          </SidebarMenuItem>
          <SidebarMenuItem>
            <SidebarMenuButton render={<a href="#" />}>
              <HeartIcon />
              Favoritos
            </SidebarMenuButton>
          </SidebarMenuItem>
          <SidebarMenuItem>
            <SidebarMenuButton render={<a href="/acerca-de" />}>
              Acerca de
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarFooter>
      <SidebarRail />
    </Sidebar>
  )
}
