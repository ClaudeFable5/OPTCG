-- MANUAL: OP17-020 / 샹크스 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-020]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=1,
              filter={
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[ALTERNATIVE_COST]],
            options={
              {
                {
                  count=1,
                  op=[[TRASH_HAND]],
                },
              },
              {
                {
                  count=1,
                  op=[[REST_DON]],
                },
              },
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동 메인】【턴 1회】자신의 패 1장을 버리거나 자신의 두웅!! 1장을 레스트로 할 수 있다：상대의 레스트 상태인 캐릭터 1장까지는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-020]],
    schema_version=1,
  })
end
