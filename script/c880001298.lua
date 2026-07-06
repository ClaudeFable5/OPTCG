-- AUTO-GENERATED: OP10-083 / 코즈키 모모노스케
-- rules_id=OP10-083 script_id=880001298 fingerprint=a44612609168c70bdff457db9abafa7741f8d84aefb55c6b6de5a9ff6666b132
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=1,
            filter={
              trait=[[드레스로자]],
            },
            kinds={
              [[LEADER]],
              [[STAGE]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터와 자신의 《드레스로자》 특징을 가진, 리더 또는 스테이지 1장을 레스트할 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-083]],
    schema_version=1,
  })
end
