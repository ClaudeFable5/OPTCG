-- AUTO-GENERATED: OP04-026 / 세뇨르 핑크
-- rules_id=OP04-026 script_id=880000517 fingerprint=3a6e5d7023c355ab011b921b6e1c68a1f204082bf47953a952ae3154a35233e5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            schedule=[[THIS_TURN_END]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[돈키호테 해적단]],
          },
        },
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 자신의 리더가 《돈키호테 해적단》 특징을 가진 경우, 상대의 코스트 4 이하인 캐릭터를 1장까지 레스트로 한다. 그 후, 이번 턴 종료 시, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-026]],
    schema_version=1,
  })
end
