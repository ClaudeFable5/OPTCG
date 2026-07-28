-- AUTO-GENERATED: EB04-021 / 이가람
-- rules_id=EB04-021 script_id=880002442 fingerprint=3406dde95e2bce08e0ca5b718ccf832b3b8a45ce588211748be0c8bafd96bf91
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            name=[[네펠타리 비비]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「네펠타리 비비」인 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패 1장을 버릴 수 있다: 자신의 리더나 캐릭터 1장에 레스트 상태인 두웅!! 1장까지를 붙인다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-021]],
    schema_version=1,
  })
end
