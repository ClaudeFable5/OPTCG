-- AUTO-GENERATED: OP01-060 / 돈키호테 도플라밍고
-- rules_id=OP01-060 script_id=880000183 fingerprint=e1394e5c0e22fc808319321cb3a644b77033175bbd78add87681ba9c8a281313
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[왕의 부하 칠무해]],
            },
            look_count=1,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_TOP]],
            rest_order=[[KEEP]],
            rested=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 자신의 덱 맨 위를 공개하고 그 카드가 코스트 4 이하인 《왕의 부하 칠무해》 특징을 가진 캐릭터 카드인 경우, 레스트 상태로 등장시킬 수 있다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-060]],
    schema_version=1,
  })
end
