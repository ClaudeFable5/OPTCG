-- AUTO-GENERATED: OP14-019 / 「사황」 한 명을…!!! 끌어내릴 "책략"이 있다
-- rules_id=OP14-019 script_id=880002184 fingerprint=1a9a057d222653fe17a5d577aaca84974b2ab9cf3eb3881db359d43014db7422
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-019]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              trait_any={
                [[초신성]],
                [[밀짚모자 일당]],
              },
            },
            look_count=4,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 덱 위에서 4장을 보고, 《초신성》이나 《밀짚모자 일당》 특징을 가진 캐릭터 카드 1장까지를 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-019]],
    schema_version=1,
  })
end
